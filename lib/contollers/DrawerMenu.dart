import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/models/Shop.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Contacts.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/Coupons.dart';
import 'package:myapp/views/Sales.dart';
import 'package:myapp/views/Shops.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu(
      {Key? key, required Queue<BuildContext> queue, required this.updateTitle})
      : super(key: key) {
    _queue = queue;
  }

  late Queue<BuildContext> _queue;
  final ValueChanged<String?> updateTitle;

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
              if (_queue.isNotEmpty) {
                Navigator.pushAndRemoveUntil(
                    keyFragmentBody.currentState?.getContext() as BuildContext,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                    (route) => true);
                _queue.clear();
              }
              Navigator.pop(context);
              keyNavBar.currentState!.selectItem(Screen.Home);
              updateTitle(screenTitles[Screen.Home]);
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text("Купоны"),
            onTap: () {
              if (_queue.isNotEmpty) {
                Navigator.of(_queue.removeLast()).pushReplacement(
                    MaterialPageRoute(builder: (context) => Coupons()));
              } else {
                Navigator.of(keyFragmentBody.currentState?.getContext()
                        as BuildContext)
                    .push(MaterialPageRoute(builder: (context) => Coupons()));
              }
              _queue.addLast(
                  keyFragmentBody.currentState?.getContext() as BuildContext);
              Navigator.pop(context);
              keyNavBar.currentState!.selectItem(Screen.Home);
              updateTitle(screenTitles[Screen.Coupons]);
            },
          ),
          ListTile(
            leading: Icon(Icons.percent),
            title: Text("Акции"),
            onTap: () {
              if (_queue.isNotEmpty) {
                Navigator.of(_queue.removeLast()).pushReplacement(
                    MaterialPageRoute(builder: (context) => Sales()));
              } else {
                Navigator.of(keyFragmentBody.currentState?.getContext()
                        as BuildContext)
                    .push(MaterialPageRoute(builder: (context) => Sales()));
              }
              _queue.addLast(
                  keyFragmentBody.currentState?.getContext() as BuildContext);
              Navigator.pop(context);
              keyNavBar.currentState!.selectItem(Screen.Sales);
              updateTitle(screenTitles[Screen.Sales]);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Личный кабинет"),
            onTap: () {
              if (_queue.isNotEmpty) {
                Navigator.of(_queue.removeLast()).pushReplacement(
                    MaterialPageRoute(builder: (context) => Cabinet()));
              } else {
                Navigator.of(keyFragmentBody.currentState?.getContext()
                        as BuildContext)
                    .push(MaterialPageRoute(builder: (context) => Cabinet()));
              }
              _queue.addLast(
                  keyFragmentBody.currentState?.getContext() as BuildContext);
              Navigator.pop(context);
              keyNavBar.currentState!.selectItem(Screen.Cabinet);
              updateTitle(screenTitles[Screen.Cabinet]);
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Магазины"),
            onTap: () {
              if (_queue.isNotEmpty) {
                Navigator.of(_queue.removeLast()).pushReplacement(
                    MaterialPageRoute(builder: (context) => Shops()));
              } else {
                Navigator.of(keyFragmentBody.currentState?.getContext()
                        as BuildContext)
                    .push(MaterialPageRoute(builder: (context) => Shops()));
              }
              _queue.addLast(
                  keyFragmentBody.currentState?.getContext() as BuildContext);
              Navigator.pop(context);
              keyNavBar.currentState!.selectItem(Screen.Home);
              updateTitle(screenTitles[Screen.Shops]);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Контакты"),
            onTap: () {
              if (_queue.isNotEmpty) {
                Navigator.of(_queue.removeLast()).pushReplacement(
                    MaterialPageRoute(builder: (context) => Contacts()));
              } else {
                Navigator.of(keyFragmentBody.currentState?.getContext()
                        as BuildContext)
                    .push(MaterialPageRoute(builder: (context) => Contacts()));
              }
              _queue.addLast(
                  keyFragmentBody.currentState?.getContext() as BuildContext);
              Navigator.pop(context);
              keyNavBar.currentState!.selectItem(Screen.Contacts);
              updateTitle(screenTitles[Screen.Contacts]);
            },
          ),
        ],
      ),
    );
  }
}
