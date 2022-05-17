import 'package:flutter/material.dart';
import 'package:myapp/views/Contacts.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/Sales.dart';

class BottomNavBarMenu extends StatefulWidget {
  const BottomNavBarMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBarMenu> createState() => _BottomNavBarMenuState();
}

class _BottomNavBarMenuState extends State<BottomNavBarMenu> {
  BuildContext? globContext;

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pop(globContext!);
        Navigator.push(globContext!,
            MaterialPageRoute(builder: (context) => const Home()));
        break;
      case 1:
        Navigator.pop(globContext!);
        Navigator.push(globContext!,
            MaterialPageRoute(builder: (context) => const Sales()));
        break;
      case 2:
        Navigator.pop(globContext!);
        Navigator.push(globContext!,
            MaterialPageRoute(builder: (context) => const Contacts()));
        break;
      case 3:
        Navigator.pop(globContext!);
        Navigator.push(globContext!,
            MaterialPageRoute(builder: (context) => const Cabinet()));
        break;
      default:
        print("JOPPAAAA");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    globContext = context;
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: "Главная"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: "Поиск"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colors.black,
            ),
            label: "Информация"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: "Кабинет"),
      ],
      fixedColor: Colors.black,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: onItemTapped,
    );
  }
}
