import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/models/Shop.dart';
import 'package:myapp/models/ShopsCollection.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class Shops extends StatelessWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Магазины",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),
      drawer: DrawerMenu(),
      body: ShopsView(),
      bottomNavigationBar: BottomNavBarMenu(),
    );
    ;
  }
}

class ShopsView extends StatefulWidget {
  @override
  ShopsViewState createState() => ShopsViewState();
}

class ShopsViewState extends State<ShopsView> {
  final List<MapObject> mapObjects = [];
  late YandexMapController yaMapController;
  static const Point startLocation = Point(latitude: 52.2978, longitude: 104.296);
  final animation = const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  ShopsViewState() {
    prepareMapObjects();
  }

  void prepareMapObjects() {
    ShopsCollection shopsCollection = ShopsCollection();
    List<Shop> allShops = shopsCollection.getShopsCollection();

    BitmapDescriptor bitmapMarker = BitmapDescriptor.fromAssetImage('assets/bsmarker.png');

    for (Shop shop in allShops) {
      final Placemark placemark = Placemark(
        mapId: MapObjectId(shop.address),
        point: shop.coordinates,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: bitmapMarker,
            scale: 0.2,
          ),
        ),
        opacity: 1,
        onTap: (Placemark currPlacemark, Point location) async {
          Placemark currPlacemarkCopy = currPlacemark.clone();
          Placemark modifiedPlacemark = currPlacemark.copyWith(
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: bitmapMarker,
                scale: 0.3,
              ),
            ),);
          setState(() {
            mapObjects[mapObjects.indexOf(currPlacemark)] = modifiedPlacemark;
          });
          
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Адрес магазина'),
              content: Text(currPlacemark.mapId.value),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Закрыть');
                    setState(() {
                      mapObjects[mapObjects.indexOf(modifiedPlacemark)] = currPlacemarkCopy;
                    });
                  }, 
                  child: const Text('Закрыть'),
                ),
              ],
            ),
          );
        }
      );

      mapObjects.add(placemark);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
          child: Container(
              child: YandexMap(
        logoAlignment: MapAlignment(
            horizontal: HorizontalAlignment.left,
            vertical: VerticalAlignment.top),
        mapObjects: mapObjects,
        onMapCreated: (YandexMapController yandexMapController) async {
          yaMapController = yandexMapController;
          yaMapController
              .moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: startLocation,
            zoom: 11,
          )));
        },
      )))
    ]));
  }
}
