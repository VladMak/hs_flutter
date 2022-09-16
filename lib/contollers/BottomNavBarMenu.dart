import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myapp/domain/App.dart';
import 'package:myapp/main.dart';
import 'package:myapp/views/Contacts.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/LoginSignupPage.dart';
import 'package:myapp/views/Sales.dart';
import 'package:myapp/models/Api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'ProgressItem.dart';

class BottomNavBarMenu extends StatefulWidget {
  @override
  State<BottomNavBarMenu> createState() => BottomNavBarMenuState();
}

class BottomNavBarMenuState extends State<BottomNavBarMenu> {
  Screen _currentScreenId = Screen.Home;

  void selectItem(Screen id) {
    setState(() {
      _currentScreenId = id;
    });
  }

  void _changeScreenId(Screen id) async {
    setState(() {
      selectItem(id);
    });
  }

  void navigate(int index, BuildContext context, App app) {
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false,
            arguments: app);
        break;
      case 1:
        Navigator.pushNamedAndRemoveUntil(context, "/shop", (route) => false,
            arguments: app);
        break;
      case 2:
        Navigator.pushNamedAndRemoveUntil(
            context, "/contacts", (route) => false,
            arguments: app);
        break;
      case 3:
        Navigator.pushNamedAndRemoveUntil(context, "/cabinet", (route) => false,
            arguments: app);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    var app = new App();
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Главная"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Поиск"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
            ),
            label: "Информация"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Кабинет"),
      ],
      selectedItemColor: Colors.black, //Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      unselectedItemColor: Colors.black,
      onTap: (index) =>
          navigate(index, context, app), //_changeScreenId(Screen.values[index])
      currentIndex: 1,
    );
  }
}
