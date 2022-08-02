import 'package:flutter/material.dart';

import '../main.dart';

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
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              CouponItem(),
              CouponItem2(),
              CouponItem3(),
              CouponItem(),
              CouponItem2()
            ],
          )
        ],
      ),
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

  Widget _showMyCoupons(BuildContext context) {
    if (_loadMyCoupons())
      return ListView(children: <Widget>[
        Column(
          children: myCoupons,
        ),
      ]);
    else
      return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/my_coupons.png",
              height: 128,
              width: 128,
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                "У вас пока что нет персональных купонов:(",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "Смотрите все доступные купоны и выбирайте понравившиеся для совершения более выгодных покупок",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(keyNavBar.currentState?.getQueue().removeLast()
                            as BuildContext)
                        .pushReplacement(
                            MaterialPageRoute(builder: (context) => Coupons()));
                    keyNavBar.currentState?.getQueue().addLast(
                        keyFragmentBody.currentState?.getContext()
                            as BuildContext);
                    keyNavBar.currentState?.selectItem(Screen.Home);
                    keyNavBar.currentState?.widget
                        .updateTitle(screenTitles[Screen.Coupons]);
                    Navigator.pop(context);
                  },
                  child: Text("Перейти к купонам"),
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                    return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                  })),
                )
              ],
            ),
          ],
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
          body: _showMyCoupons(context),
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
      child: Image(image: AssetImage("assets/01/_-2.png")),
    );
  }
}

class CouponItem2 extends StatelessWidget {
  const CouponItem2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Image(image: AssetImage("assets/01/_-5.png")),
    );
  }
}

class CouponItem3 extends StatelessWidget {
  const CouponItem3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Image(image: AssetImage("assets/01/_-11.png")),
    );
  }
}
