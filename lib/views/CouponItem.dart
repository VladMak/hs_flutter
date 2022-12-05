import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';

class CouponItemN extends StatefulWidget {
  Map<String, Widget Function(BuildContext)> routes = {};
  String src = "";
  CouponItemN(String src, Map<String, Widget Function(BuildContext)> routes) {
    this.src = src;
    this.routes = routes;
  }

  @override
  State<CouponItemN> createState() => _CouponItemNState(src, routes);
}

class _CouponItemNState extends State<CouponItemN> {
  Map<String, Widget Function(BuildContext)> routes = {};
  String src = "";
  _CouponItemNState(
      String src, Map<String, Widget Function(BuildContext)> routes) {
    this.src = src;
    this.routes = routes;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              child: Image(image: AssetImage("assets/logo.png")),
              padding: EdgeInsets.all(5),
            )
          ],
          leading: Builder(builder: (context) {
            return GestureDetector(
              child: Image(
                image: AssetImage('assets/icons/_-12.png'),
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Купон",
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFFE51D08),
                    const Color(0xFFf2b11a),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
        ),
        drawer: DrawerMenu(),
        bottomNavigationBar: BottomNavBarMenu(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            Image.network(
                "https://smmon.slata.com/getOrder/" + "img/" + this.src),
            Text("Какое то описание купона")
          ]),
        ),
      ),
      routes: this.routes,
    );
  }
}
