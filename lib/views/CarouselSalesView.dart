import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSales extends StatelessWidget {
  const CarouselSales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:
                        BoxDecoration(color: Colors.amber.withOpacity(0)),
                    child: Image(
                      image: AssetImage('assets/catalog02.png'),
                    )));
          },
        );
      }).toList(),
    );
  }
}

// Реализуем собственный слайдер карусель
// для каталога с кнопками переключения
class CatalogView extends StatefulWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  CarouselController buttonController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CarouselSlider(
        carouselController: buttonController,
        options: CarouselOptions(
          height: 400.0,
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration:
                          BoxDecoration(color: Colors.amber.withOpacity(0)),
                      child: Image(
                        image: AssetImage('assets/catalog01.png'),
                      )));
            },
          );
        }).toList(),
      ),
      Row(
        children: [
          ElevatedButton(
            onPressed: () {
              buttonController.previousPage(
                  duration: Duration(milliseconds: 800), curve: Curves.linear);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            style: ButtonStyle(backgroundColor:
                MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
              return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
            })),
          ),
          ElevatedButton(
            onPressed: () {
              buttonController.nextPage(
                  duration: Duration(milliseconds: 800), curve: Curves.linear);
            },
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            style: ButtonStyle(backgroundColor:
                MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
              return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
            })),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }
}
