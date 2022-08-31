import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/models/Shop.dart';
import 'package:myapp/models/ShopsCollection.dart';
import 'dart:math';

class Shops extends StatefulWidget {
  @override
  State<Shops> createState() => ShopsState();
}

class ShopsState extends State<Shops> {
  late Geolocator _geolocator;
  late Position _position;

  Future<dynamic> _coordinates() async {
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

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Text("${nearestShop.address}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
    ;
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

  _allShops() {
    List<Widget> allShops = [];

    for (Shop shop in ShopsCollection().getShopsCollection()) {
      allShops.add(Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Text(
          shop.address,
          style: TextStyle(),
        ),
      ));
    }

    return allShops;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Ближайший магазин:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder(
                future: _coordinates(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data as Widget;
                  } else
                    return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text("Поиск ближайшего магазина..."));
                }),
            Container(
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Адреса магазинов:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _allShops()),
          ],
        ));
  }
}
