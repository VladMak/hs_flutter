import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/domain/App.dart';

/*class Sales extends StatelessWidget {
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
    ;
  }
}*/

class Sales extends StatelessWidget {
  const Sales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    App app = settings.arguments as App;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Акции",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
        ),
        // Боковое меню
        drawer: DrawerMenu(),
        // Контейнер, где будут показываться основные экраны
        //body: Fragment(key: keyFragmentBody),
        body: Container(
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
        ),
        // Нижний навбар
        bottomNavigationBar: BottomNavBarMenu(),
      ),
      routes: app.Routes,
    );
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
