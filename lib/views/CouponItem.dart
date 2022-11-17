import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/domain/App.dart';

class CouponElement extends StatefulWidget {
  const CouponElement({Key? key}) : super(key: key);

  @override
  State<CouponElement> createState() => _CouponElementState();
}

class _CouponElementState extends State<CouponElement> {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    App app = settings.arguments as App;
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Container(
            width: 100,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 45),
            child: FloatingActionButton(
              child: Image(
                image: AssetImage("assets/virtcard.png"),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/cabinet");
              },
              backgroundColor: Color.fromARGB(0, 0, 0, 0),
              elevation: 0,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        // Боковое меню
        drawer: DrawerMenu(),
        // Контейнер, где будут показываться основные экраны
        //body: Fragment(key: keyFragmentBody),
        body: Container(
            child: ListView(
              children: [
                Image.network("https://smmon.slata.com/getOrder/" +
                    "img/" +
                    app.CouponId),
                Container(
                  child: BarcodeWidget(
                    data: "1234567890", // Тут штрих код
                    barcode: Barcode.code128(),
                    width: 300,
                    drawText: false,
                  ),
                  padding: EdgeInsets.all(30),
                ),
                Container(
                  child: Text("Тут описание купона"),
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                )
              ],
            ),
            padding: EdgeInsets.all(10)),
        // Нижний навбар
        bottomNavigationBar: BottomNavBarMenu(),
      ),
      routes: app.Routes,
    );
  }
}
