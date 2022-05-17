import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/views/CarouselSalesView.dart';
import 'package:myapp/contollers/FloatingBut.dart';
import 'package:myapp/models/Db.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Хлеб Соль",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),
      drawer: DrawerMenu(),
      body: HomeView(),
      bottomNavigationBar: BottomNavBarMenu(),
      floatingActionButton: FloatingBut(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: <Widget>[
        Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  var test = Db();
                  test.testConnect();
                },
                child: Text("BUT")),
            CarouselSales(),
            Text("Каталог"),
            CatalogView(),
          ],
        )
      ],
    );
  }
}
