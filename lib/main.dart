import 'dart:collection';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/domain/App.dart';
import 'package:myapp/models/Api.dart';
import 'package:myapp/views/Contacts.dart';
import 'package:myapp/views/Coupons.dart';
import 'package:myapp/views/Fragment.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/LoginSignupPage.dart';
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
  String? appBarTitle = "Главная";

  // Метод для обновления названия текущего экрана
  void _setAppBarTitle(String? title) {
    setState(() {
      appBarTitle = title;
    });
  }

  Future<bool> CheckToken() async {
    var api = Api();
    var login = await api.checkToken();
    if (login) {
      return true; // cabinet
    } else {
      return false; // login
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CheckToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data as bool;
            print("TUTTTTT ${data}");
            if (!data) {
              return LoginSignupPage();
            } else {
              return Cabinet();
            }
          } else {
            return CircularProgressIndicator();
          }
        });
    return Home();
  }
}
