import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:myapp/models/Shop.dart';
import 'package:myapp/models/ShopsCollection.dart';

class Map extends StatelessWidget {
  late Geolocator _geolocator;
  late Position _position;

  Future<Shop> _coordinates() async {
    _position = await _determinePosition();

    var minDistance = 0.0;
    Shop nearestShop = Shop('', Point(latitude: 0.0, longitude: 0.0));

    for (Shop shop in ShopsCollection().getShopsCollection()) {
      var distance = sqrt(
          pow(shop.coordinates.latitude - _position.latitude, 2) +
              pow(shop.coordinates.longitude - _position.longitude, 2));
      if (minDistance == 0.0) {
        minDistance = distance;
        nearestShop = shop;
      } else {
        if (distance < minDistance) {
          minDistance = distance;
          nearestShop = shop;
        }
      }
    }

    return nearestShop;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    //var l = this._coordinates();
    return FutureBuilder(
        future: _coordinates(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var l = snapshot.data as Shop;
            print("COORD: ${l.coordinates.latitude}");
            return new FlutterMap(
              options: new MapOptions(
                center:
                    new LatLng(l.coordinates.latitude, l.coordinates.longitude),
                zoom: 16.0,
              ),
              layers: [
                new TileLayerOptions(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                new MarkerLayerOptions(
                  markers: getMarkers(),
                ),
              ],
            );
          } else
            _geolocator = Geolocator();
          return Container(
            child: Container(
                width: 60,
                height: 50,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                )),
            width: 10,
            height: 10,
            padding: EdgeInsets.fromLTRB(100, 200, 100, 200),
          );
        });
  }
}

List<Marker> getMarkers() {
  List<Marker> lm = [];
  for (Shop shop in ShopsCollection().getShopsCollection()) {
    lm.add(new Marker(
        width: 20.0,
        height: 20.0,
        point:
            new LatLng(shop.coordinates.latitude, shop.coordinates.longitude),
        builder: (ctx) => new Container(
              child: Image(image: AssetImage('assets/bsmarker.png')),
            )));
  }
  return lm;
}
