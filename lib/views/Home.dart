import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/models/Mailer.dart';
import 'package:myapp/models/Shop.dart';
import 'package:myapp/models/ShopsCollection.dart';
import 'package:myapp/views/CarouselSalesView.dart';
import 'package:myapp/models/Api.dart';
import 'package:myapp/views/LoginSignupPage.dart';
import 'dart:typed_data';
import 'dart:math';
import 'package:geolocator/geolocator.dart';

import '../main.dart';

/*class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Хлеб Соль",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),
      drawer: DrawerMenu(),
      body: HomeView(),
      bottomNavigationBar: BottomNavBarMenu(),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: SizedBox(
          width: 80,
          child: FloatingActionButton(
            onPressed: () {},
            child: Image(
              image: AssetImage('assets/virtcard.png'),
            ),
            backgroundColor: Colors.white.withOpacity(0),
            elevation: 0,
            hoverColor: Colors.white.withOpacity(0),
            hoverElevation: 0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}*/

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  late Geolocator _geolocator;
  late Position _position;

  Future<dynamic> _coordinates() async {
    _position = await _determinePosition();

    var minDistance = 0.0;
    Shop nearestShop = Shop('', Point(latitude: 0.0, longitude: 0.0));

    for(Shop shop in ShopsCollection().getShopsCollection()){
      var distance = sqrt(pow(shop.coordinates.latitude - _position.latitude, 2) + pow(shop.coordinates.longitude - _position.longitude, 2));
      if (minDistance == 0.0){
        minDistance = distance;
        nearestShop = shop;
      }
      else{
        if(distance < minDistance){
          minDistance = distance;
          nearestShop = shop;
        }
      }
    }

    return Text("${nearestShop.address}");
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
  Container build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Column(
            children: [
              FutureBuilder(
                  future: _coordinates(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data as Widget;
                    } else
                      return Center(child: Text("Поиск ближайшего магазина..."));
                  }),
              CarouselSales(),
              Text("Каталог"),
              CatalogView(),
            ],
          )
        ],
      ),
    );
  }
}
