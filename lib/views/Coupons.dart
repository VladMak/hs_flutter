import 'package:flutter/material.dart';

/*class Coupons extends StatelessWidget {
  const Coupons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Купоны",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),
      drawer: DrawerMenu(),
      body: CouponsView(),
      //bottomNavigationBar: BottomNavBarMenu(),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: SizedBox(
          width: 80,
          child: FloatingActionButton(
            onPressed: () {},
            child: Image(
              image: AssetImage('assets/virtcard.png'),
            ),
            backgroundColor: Colors.white.withOpacity(0),
            elevation: 0,
            hoverColor: Colors.white.withOpacity(0),
            hoverElevation: 0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}*/

class Coupons extends StatelessWidget {
  const Coupons({
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
  }
}

class MyCoupons extends StatelessWidget {
  late List<CouponItem> myCoupons;

  MyCoupons({Key? key}) : super(key: key);

  bool _loadMyCoupons() {
    //TODO: реализовать код загрузки купонов
    // myCoupons = ...
    //

    // Пока предполагаем, что купонов нет
    return false;
  }

  Widget _showMyCoupons() {
    if (_loadMyCoupons())
      return ListView(children: <Widget>[
        Column(
          children: myCoupons,
        ),
      ]);
    else
      return Center(
        child: Text(
          "У вас пока что нет персональных купонов:(",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "Мои купоны",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
          ),
          body: _showMyCoupons(),
        ),
        onWillPop: () async {
          return true;
        });
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
