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
import 'package:myapp/views/Sales.dart';
import 'package:myapp/views/Shops.dart';
import 'package:myapp/views/Map.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = new App();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image(
              image: AssetImage("assets/biglogo.png"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Главная"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false,
                  arguments: app);
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text("Купоны"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/coupons', (route) => false,
                  arguments: app);
            },
          ),
          ListTile(
            leading: Icon(Icons.percent),
            title: Text("Акции"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/promotion', (route) => false,
                  arguments: app);
            },
          ),
          ListTile(
            leading: Icon(Icons.store_mall_directory_outlined),
            title: Text("Магазины"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/shop', (route) => false,
                  arguments: app);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Личный кабинет"),
            onTap: () async {
              var api = Api();
              var login = await api.checkToken();

              if (login) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/cabinet', (route) => false,
                    arguments: app);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false,
                    arguments: app);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Контакты"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/contacts', (route) => false,
                  arguments: app);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Каталог"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/catalog', (route) => false,
                  arguments: app);
            },
          ),
        ],
      ),
    );
  }
}
