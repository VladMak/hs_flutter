import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/FloatingBut.dart';

class Sales extends StatelessWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Акции",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),
      drawer: DrawerMenu(),
      body: SalesView(),
      bottomNavigationBar: BottomNavBarMenu(),
      floatingActionButton: FloatingBut(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    ;
  }
}

class SalesView extends StatelessWidget {
  const SalesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: [
            CouponItem(),
            CouponItem(),
            CouponItem(),
            CouponItem(),
            CouponItem()
          ],
        )
      ],
    );
    ;
  }
}

class CouponItem extends StatelessWidget {
  const CouponItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Image(image: AssetImage("assets/catalog02.png")),
    );
  }
}
