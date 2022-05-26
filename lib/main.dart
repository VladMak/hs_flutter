import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/views/Fragment.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/Sales.dart';

enum Screen { Home, Sales, Contacts, Cabinet, Coupons, Shops }

const Map<Screen, String> screenTitles = {
  Screen.Home: "Хлеб Соль",
  Screen.Sales: "Акции",
  Screen.Contacts: "Контакты",
  Screen.Cabinet: "Профиль",
  Screen.Coupons: "Купоны",
  Screen.Shops: "Магазины",
};

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10)),
    home: MainContainer(),
  ));
} //test

final keyFragmentBody = GlobalKey<FragmentState>();
final keyNavBar = GlobalKey<BottomNavBarMenuState>();

class MainContainer extends StatefulWidget {
  MainContainer({Key? key}) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  Queue<BuildContext> _queue = Queue();

  String? appBarTitle = screenTitles[Screen.Home];

  void _setAppBarTitle(String? title) {
    setState(() {
      appBarTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_queue.isNotEmpty) {
            Navigator.of(_queue.removeLast()).pop();
            keyNavBar.currentState?.selectItem(Screen.Home);
            _setAppBarTitle(screenTitles[Screen.Home]);
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              appBarTitle!,
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
          ),
          drawer: DrawerMenu(
            queue: _queue,
            updateTitle: _setAppBarTitle,
          ),
          body: Fragment(key: keyFragmentBody),
          bottomNavigationBar: BottomNavBarMenu(
            key: keyNavBar,
            queue: _queue,
            updateTitle: _setAppBarTitle,
          ),
        ));
  }
}