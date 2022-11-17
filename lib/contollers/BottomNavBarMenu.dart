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

  void navigate(int index, BuildContext context, App app) async {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, "/home", arguments: app);
        break;
      case 1:
        Navigator.pushNamed(context, "/shop", arguments: app);
        break;
      case 2:
        Navigator.pushNamed(context, "/contacts", arguments: app);
        break;
      case 3:
        var api = Api();
        var login = await api.checkToken();

        if (login) {
          print("JOPA");
          Navigator.pushNamed(context, '/cabinet', arguments: app);
        } else {
          Navigator.pushNamed(context, '/login', arguments: app);
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    var app = new App();
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Image(image: AssetImage("assets/icons/_-01.png"), width: 35),
            label: "Главная"),
        BottomNavigationBarItem(
            icon: Image(image: AssetImage("assets/icons/_-09.png"), width: 35),
            label: "Поиск"),
        BottomNavigationBarItem(
            icon: Image(image: AssetImage("assets/icons/_-06.png"), width: 35),
            label: "Информация"),
        BottomNavigationBarItem(
            icon: Image(image: AssetImage("assets/icons/_-05.png"), width: 35),
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
