import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:myapp/contollers/FloatingBut.dart';

class Shops extends StatelessWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Магазины",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),
      drawer: DrawerMenu(),
      body: ShopsView(),
      bottomNavigationBar: BottomNavBarMenu(),
      floatingActionButton: FloatingBut(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    ;
  }
}

class ShopsView extends StatelessWidget {
  const ShopsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("sdf");
  }
}
