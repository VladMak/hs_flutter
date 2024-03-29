import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myapp/contollers/ProgressItem.dart';
import 'package:myapp/domain/App.dart';
import 'package:myapp/main.dart';
import 'package:myapp/models/Api.dart';
import 'package:myapp/views/Catalog.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Contacts.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/Coupons.dart';
import 'package:myapp/views/LoginSignupPage.dart';
import 'package:myapp/views/Map2.dart';
import 'package:myapp/views/Sales.dart';
import 'package:myapp/views/Shops.dart';
import 'package:myapp/views/Map.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = new App();
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Image(
                  image: AssetImage("assets/icons/_-14.png"),
                ),
                color: Color.fromARGB(255, 255, 0, 0),
              ),
              padding: EdgeInsets.all(0),
            ),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0), width: 1.0),
                    left: BorderSide(color: Colors.white, width: 1.0),
                    right: BorderSide(color: Colors.white, width: 1.0),
                  )),
              child: ListTile(
                leading: Image(
                    image: AssetImage("assets/icons/_-01.png"), width: 50),
                title: Text("MAP WebView"),
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: ((context) => Map2()));
                  Navigator.push(context, route);
                },
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0), width: 1.0),
                    left: BorderSide(color: Colors.white, width: 1.0),
                    right: BorderSide(color: Colors.white, width: 1.0),
                  )),
              child: ListTile(
                leading: Image(
                    image: AssetImage("assets/icons/_-01.png"), width: 50),
                title: Text("Главная"),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/home', arguments: app);
                },
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0), width: 1.0),
                    left: BorderSide(color: Colors.white, width: 1.0),
                    right: BorderSide(color: Colors.white, width: 1.0),
                  )),
              child: ListTile(
                leading: Image(
                    image: AssetImage("assets/icons/_-02.png"), width: 50),
                title: Text("Купоны"),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/coupons',
                      arguments: app);
                },
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0), width: 1.0),
                    left: BorderSide(color: Colors.white, width: 1.0),
                    right: BorderSide(color: Colors.white, width: 1.0),
                  )),
              child: ListTile(
                leading: Image(
                    image: AssetImage("assets/icons/_-03.png"), width: 50),
                title: Text("Акции"),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/promotion',
                      arguments: app);
                },
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0), width: 1.0),
                    left: BorderSide(color: Colors.white, width: 1.0),
                    right: BorderSide(color: Colors.white, width: 1.0),
                  )),
              child: ListTile(
                leading: Image(
                    image: AssetImage("assets/icons/_-07.png"), width: 50),
                title: Text("Магазины"),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/shop', arguments: app);
                },
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0), width: 1.0),
                    left: BorderSide(color: Colors.white, width: 1.0),
                    right: BorderSide(color: Colors.white, width: 1.0),
                  )),
              child: ListTile(
                leading: Image(
                    image: AssetImage("assets/icons/_-07.png"), width: 50),
                title: Text("Магазины2"),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Map2()));
                },
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0), width: 1.0),
                    left: BorderSide(color: Colors.white, width: 1.0),
                    right: BorderSide(color: Colors.white, width: 1.0),
                  )),
              child: ListTile(
                leading: Image(
                    image: AssetImage("assets/icons/_-05.png"), width: 50),
                title: Text("Личный кабинет"),
                onTap: () async {
                  var api = Api();
                  var login = await api.checkToken();

                  if (login) {
                    Navigator.popAndPushNamed(context, '/cabinet',
                        arguments: app);
                  } else {
                    Navigator.popAndPushNamed(context, '/login',
                        arguments: app);
                  }
                },
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0), width: 1.0),
                    left: BorderSide(color: Colors.white, width: 1.0),
                    right: BorderSide(color: Colors.white, width: 1.0),
                  )),
              child: ListTile(
                leading: Image(
                    image: AssetImage("assets/icons/_-06.png"), width: 50),
                title: Text("Контакты"),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/contacts',
                      arguments: app);
                },
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0), width: 1.0),
                    left: BorderSide(color: Colors.white, width: 1.0),
                    right: BorderSide(color: Colors.white, width: 1.0),
                  )),
              child: ListTile(
                leading: Image(
                    image: AssetImage("assets/icons/_-07.png"), width: 50),
                title: Text("Каталог"),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/catalog',
                      arguments: app);
                },
              ),
            ),
          ],
        ),
        color: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
    );
  }
}
