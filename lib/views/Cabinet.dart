import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:myapp/contollers/FloatingBut.dart';

class Cabinet extends StatefulWidget {
  const Cabinet({Key? key}) : super(key: key);

  @override
  State<Cabinet> createState() => _CabinetState();
}

class _CabinetState extends State<Cabinet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Кабинет",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),
      drawer: DrawerMenu(),
      body: CabinetView(),
      bottomNavigationBar: BottomNavBarMenu(),
      floatingActionButton: FloatingBut(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CabinetView extends StatelessWidget {
  const CabinetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: [VirtualCard()],
        )
      ],
    );
  }
}

class VirtualCard extends StatelessWidget {
  const VirtualCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image(image: AssetImage("assets/virtcard.png")),
          ),
          Padding(
            child: BarcodeWidget(
              data: "1234567890123456", // Тут штрих код
              barcode: Barcode.code128(),
              width: 300,
              drawText: false,
            ),
            padding: EdgeInsets.all(10),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: Text(
                    "Владелец: Макаров В. А.",
                  ),
                  width: 300,
                ),
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: Text(
                    "Номер: 1234567890123456",
                  ),
                  width: 300,
                ),
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: Text(
                    "ШК: 1234567890123456",
                  ),
                  width: 300,
                ),
              )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Мои купоны"),
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                    return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18); //#b31918
                  })),
                ),
                width: 300,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Редактировать профиль"),
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                    return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                  })),
                ),
                width: 300,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Обработка перс. данных"),
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                    return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                  })),
                ),
                width: 300,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("История покупок"),
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                    return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                  })),
                ),
                width: 300,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Пользовательское соглашение"),
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                    return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                  })),
                ),
                width: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
