import 'package:flutter/material.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Contacts.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/Coupons.dart';
import 'package:myapp/views/Sales.dart';
import 'package:myapp/views/Shops.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text("Купоны"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Coupons()));
            },
          ),
          ListTile(
            leading: Icon(Icons.percent),
            title: Text("Акции"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Sales()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Личный кабинет"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cabinet()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Магазины"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Shops()));
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Контакты"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Contacts()));
            },
          ),
        ],
      ),
    );
  }
}
