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
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Ваш купон",
            style: TextStyle(color: Colors.black),
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
