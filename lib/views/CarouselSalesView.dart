import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/drivers/image_worker.dart';

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
      items: [2, 5, 11].map((i) {
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
                      image: AssetImage('assets/01/_-' + i.toString() + '.png'),
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

  var imgworker = ImageWorker();
  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: imgworker.getCatalogImages(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var imgs = snapshot.data as List<String>;
          return Column(children: <Widget>[
            CarouselSlider(
              carouselController: buttonController,
              options: CarouselOptions(height: 550.0, viewportFraction: 1.0),
              items: imgs.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
                        child: Container(
                          width: mywidth,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.black),
                          child: Image.network(
                            "https://smmon.slata.com/getOrder/" +
                                "img/" +
                                i.toString(),
                            width: mywidth,
                            fit: BoxFit.cover,
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          ]);
        } else {
          return Text("Загружается...");
        }
      }),
    )
        /**/
        ;
  }
}
