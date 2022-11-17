import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/domain/App.dart';
import 'package:myapp/drivers/image_worker.dart';
import 'package:myapp/views/SaleItem.dart';

class MyCoupons extends StatefulWidget {
  const MyCoupons({Key? key}) : super(key: key);

  @override
  State<MyCoupons> createState() => _MyCouponsState();
}

class _MyCouponsState extends State<MyCoupons> {
  @override
  Widget build(BuildContext context) {
    var app = App();
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
            "Мои купоны",
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
              builder: ((context) => SaleItems(this.src, routes)));
          Navigator.push(context, route);
        },
      ),
    );
  }
}
