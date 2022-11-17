import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/domain/App.dart';
import 'package:myapp/drivers/image_worker.dart';
import 'package:myapp/views/SaleItem.dart';

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
            "Акции",
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
            color: Colors.white,
            child: ListView(children: [
              FutureBuilder(
                future: imgworker.getSalesList(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    var imgs = snapshot.data as List<String>;
                    return AllSalesCoupon(imgs, app.Routes);
                  } else {
                    return Text("Загружается...");
                  }
                }),
              )
            ])),

        /*Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(
                children: [AllSalesCoupon(images)],
              )
            ],
          ),
        ),*/
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
