import 'dart:collection';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/views/Fragment.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/Sales.dart';

// Основные экраны
enum Screen { Home, Sales, Contacts, Cabinet, Coupons, Shops, Signup }

// Имена экранов
const Map<Screen, String> screenTitles = {
  Screen.Home: "Хлеб Соль",
  Screen.Sales: "Акции",
  Screen.Contacts: "Контакты",
  Screen.Cabinet: "Профиль",
  Screen.Coupons: "Купоны",
  Screen.Shops: "Магазины",
  Screen.Signup: "Вход",
};

void main() {
  runApp(MaterialApp(
    // Устанавливаем локаль
    localizationsDelegates: [GlobalMaterialLocalizations.delegate],
    supportedLocales: [
      const Locale('ru'),
    ],
    theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10)),
    home: MainContainer(),
  ));
} //test

// Глобальные ключи для доступа к Фрагменту и навбару
final keyFragmentBody = GlobalKey<FragmentState>();
final keyNavBar = GlobalKey<BottomNavBarMenuState>();

class MainContainer extends StatefulWidget {
  MainContainer({Key? key}) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  // Очередь для хранения билд контекстов
  Queue<BuildContext> _queue = Queue();

  // Поле для хранения названия текущего экрана
  String? appBarTitle = screenTitles[Screen.Home];

  // Метод для обновления названия текущего экрана
  void _setAppBarTitle(String? title) {
    setState(() {
      appBarTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // Обработка перехода назад
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
          // Боковое меню
          drawer: DrawerMenu(
            queue: _queue,
            updateTitle: _setAppBarTitle,
          ),
          // Контейнер, где будут показываться основные экраны
          //body: Fragment(key: keyFragmentBody),
          body: Home(),
          // Нижний навбар
          bottomNavigationBar: BottomNavBarMenu(
            key: keyNavBar,
            queue: _queue,
            updateTitle: _setAppBarTitle,
          ),
        ));
  }
}
