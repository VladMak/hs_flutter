import 'package:flutter/material.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/domain/App.dart';
import 'package:myapp/drivers/image_worker.dart';
import 'package:myapp/models/Api.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/SaleItem.dart';
import 'package:myapp/views/CouponItem.dart' as ci;

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

class Coupons extends StatefulWidget {
  const Coupons({
    Key? key,
  }) : super(key: key);

  @override
  State<Coupons> createState() => CouponsState();
}

class CouponsState extends State<Coupons> {
  Api api = Api();
  late App app;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    app = settings.arguments as App;
    var imgworker = ImageWorker();
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
            "Купоны",
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
        body: FutureBuilder(
            future: imgworker.getCouponsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var imgs = snapshot.data as List<String>;
                return AllSalesCoupon(imgs, app.Routes);
              } else {
                return Text("Загружается...");
              }
            }),
        // Нижний навбар
        bottomNavigationBar: BottomNavBarMenu(),
      ),
      routes: app.Routes,
    );
  }
}

class AllSalesCoupon extends StatefulWidget {
  List<String> imgs = [];
  Map<String, Widget Function(BuildContext)> routes = {};

  AllSalesCoupon(
      List<String> imgs, Map<String, Widget Function(BuildContext)> routes) {
    this.imgs = imgs;
    this.routes = routes;
  }

  @override
  State<AllSalesCoupon> createState() => _AllSalesCouponState(imgs, routes);
}

class _AllSalesCouponState extends State<AllSalesCoupon> {
  List<String>? imgs;
  Map<String, Widget Function(BuildContext)> routes = {};

  _AllSalesCouponState(
      List<String> imgs, Map<String, Widget Function(BuildContext)> routes) {
    this.imgs = imgs;
    this.routes = routes;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> couponList = [];
    for (var element in this.imgs!) {
      couponList.add(CouponItem(element, routes));
    }
    return Column(
      children: couponList,
    );
  }
}

class CouponItem extends StatelessWidget {
  String src = "";
  Map<String, Widget Function(BuildContext)> routes = {};

  CouponItem(String src, Map<String, Widget Function(BuildContext)> routes) {
    this.src = src;
    this.routes = routes;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: Image.network(
            "https://smmon.slata.com/getOrder/" + "img/" + this.src),
        onTap: () {
          Route route = MaterialPageRoute(
              builder: ((context) => ci.CouponItemN(this.src, routes)));
          Navigator.push(context, route);
        },
      ),
    );
  }
}

class MyCoupons extends StatefulWidget {
  @override
  State<MyCoupons> createState() => MyCouponsState();
}

class MyCouponsState extends State<MyCoupons> {
  Api api = Api();
  late App app;

  Widget _loadMyCoupons(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    app = settings.arguments as App;
    return FutureBuilder<Widget>(
        future: api.GetCoupons(context, app),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data as Widget;
          } else {
            return Center(
              child: CircularProgressIndicator(
                  color: Color.fromARGB(0xFF, 0xB3, 0x19, 0x18)),
            );
          }
        }));
  }

  Widget _showMyCoupons(BuildContext context) {
    if (true)
      return ListView(children: <Widget>[
        Column(
          children: [],
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
                  onPressed: () {},
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
          body: _loadMyCoupons(context),
        ),
        onWillPop: () async {
          return true;
        });
  }
}
