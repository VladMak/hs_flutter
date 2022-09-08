import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:myapp/contollers/DrawerMenu.dart';

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
    print(
        "SIZE: ${MediaQuery.of(context).size.width} ${MediaQuery.of(context).size.height}");
    return Stack(children: [
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
              "https://img.printez.ru/products/1/19/190/190072/MTkwMDcyLTExOC0xLTEtem9vbQ==.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
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
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
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
    ]);
  }
}
