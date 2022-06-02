import 'package:flutter/material.dart';

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

  Widget _showMyPurchaseHistory() {
    if (_loadMyPurchaseHistory())
      return ListView(children: <Widget>[
        Column(
          children: myPurchaseHistory,
        ),
      ]);
    else
      return Center(
        child: Text(
          "Вы не совершили ни одной покупки",
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
              "История покупок",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
          ),
          body: _showMyPurchaseHistory(),
        ),
        onWillPop: () async {
          return true;
        });
  }
}

class Purchase extends StatelessWidget{
  Purchase({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    // TODO: реализовать отображение покупки
    return Container(child: null,);
  }
}