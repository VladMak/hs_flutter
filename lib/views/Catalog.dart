import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/domain/App.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    App app = settings.arguments as App;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Каталог",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
        ),
        // Боковое меню
        drawer: DrawerMenu(),
        // Контейнер, где будут показываться основные экраны
        //body: Fragment(key: keyFragmentBody),
        body: Stack(children: [
          Column(children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })),
              carouselController: buttonCarouselController,
              items: [0, 1, 2, 3, 4].map((i) {
                return Image.network(
                  "https://sect.ru/upload/information_system_4/0/0/2/group_2/group_2.jpg",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                );
              }).toList(),
            ),
          ]),
          Positioned(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0, 1, 2, 3, 4].map((entry) {
                    return GestureDetector(
                      onTap: () {
                        print("ENTRY $entry");
                        buttonCarouselController.animateToPage(entry);
                      },
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black)
                                .withOpacity(_current == entry ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ),
              width: MediaQuery.of(context).size.width,
            ),
            bottom: 0,
          ),
        ]),
        // Нижний навбар
        bottomNavigationBar: BottomNavBarMenu(),
      ),
      routes: app.Routes,
    );
  }
}
