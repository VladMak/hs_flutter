import 'package:flutter/material.dart';
import 'package:myapp/views/Sales.dart';

import '../main.dart';

class MyPurchaseHistory extends StatelessWidget {
  late List<Purchase> myPurchaseHistory;

  MyPurchaseHistory({Key? key}) : super(key: key);

  bool _loadMyPurchaseHistory() {
    //TODO: реализовать код загрузки истории покупок
    // myPurchaseHistory = ...
    //

    // Пока предполагаем, что покупок нет
    return false;
  }

  Widget _showMyPurchaseHistory(BuildContext context) {
    if (_loadMyPurchaseHistory())
      return ListView(children: <Widget>[
        Column(
          children: myPurchaseHistory,
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
              "assets/my_purchasement.png",
              height: 192,
              width: 192,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Вы не совершили ни одной покупки",
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
                    "Смотрите текущие акции и совершайте более выгодные покупки",
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
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sales', (route) => false);
                  },
                  child: Text("Перейти к акциям"),
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
              "История покупок",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
          ),
          body: _showMyPurchaseHistory(context),
        ),
        onWillPop: () async {
          return true;
        });
  }
}

class Purchase extends StatelessWidget {
  Purchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: реализовать отображение покупки
    return Container(
      child: null,
    );
  }
}
