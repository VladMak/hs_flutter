import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ProfileEdit extends StatelessWidget {
  ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "Редактирование профиля",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
          ),
          body: Container(
            color: Colors.grey.shade100,
            child: ListView(children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Padding(padding: EdgeInsets.all(10), child: MyDataList()),
            ]),
          ),
        ),
        onWillPop: () async {
          if (true) {
            print("Вышли");
            return true;
          }
        });
  }
}

class MyTextFieldItem extends StatefulWidget {
  MyTextFieldItem(
      {Key? key, this.value, required this.focusColor, required this.labelText, required this.onTap})
      : super(key: key);

  String? value;
  Color focusColor;
  String labelText;
  final ValueChanged<BuildContext>? onTap;

  final textController = TextEditingController();

  @override
  State<MyTextFieldItem> createState() => _MyTextFieldItemState();
}

class _MyTextFieldItemState extends State<MyTextFieldItem> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    if (widget.textController.text == "") {
      if (widget.value != null) widget.textController.text = widget.value!;
    }
    widget.textController.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.textController.text.length));
    focusNode.addListener(() {
      setState(() {});
    });

    return TextField(
      focusNode: focusNode,
      controller: widget.textController,
      cursorColor: widget.focusColor,
      //onTap: (){ widget.textController.text = widget.onTap!(context);},
      onEditingComplete: () {
        setState(() {});
      },
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.focusColor)),
        labelStyle: TextStyle(
            color:
                focusNode.hasFocus ? widget.focusColor : Colors.grey.shade500),
        labelText: widget.labelText,
      ),
    );
  }
}

class MyDataList extends StatefulWidget {
  MyDataList({Key? key}) : super(key: key);

  @override
  State<MyDataList> createState() => MyDataListState();
}

class MyDataListState extends State<MyDataList>{

  DateTime selectedDate = DateTime.now();

  Widget _addContainer(Widget part) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1))
            ]),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: part,
        ));
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _addContainer(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Личные данные",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            MyTextFieldItem(
                value: "Иванов",
                focusColor: Colors.red.shade900,
                labelText: "Фамилия",
                onTap: null,),
            SizedBox(
              height: 10,
            ),
            MyTextFieldItem(
                value: "Иван",
                focusColor: Colors.red.shade900,
                labelText: "Имя",
                onTap: null,),
            SizedBox(
              height: 10,
            ),
            MyTextFieldItem(
                value: "Иванович",
                focusColor: Colors.red.shade900,
                labelText: "Отчество", onTap: null,),
            SizedBox(
              height: 10,
            ),
            MyTextFieldItem(focusColor: Colors.red.shade900, labelText: "Пол", onTap: null,),
            SizedBox(
              height: 10,
            ),
            MyTextFieldItem(
                focusColor: Colors.red.shade900, labelText: "Дата рождения", onTap: _selectDate,),
            SizedBox(
              height: 10,
            ),
          ])),
      SizedBox(
        height: 10,
      ),
      _addContainer(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Контакты",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
          MyTextFieldItem(
              focusColor: Colors.red.shade900, labelText: "Электронная почта", onTap: null,),
          SizedBox(
            height: 10,
          ),
          MyTextFieldItem(
              focusColor: Colors.red.shade900, labelText: "Мобильный телефон", onTap: null,),
          SizedBox(
            height: 10,
          ),
          MyTextFieldItem(focusColor: Colors.red.shade900, labelText: "Город", onTap: null,),
          SizedBox(
            height: 10,
          ),
          MyTextFieldItem(focusColor: Colors.red.shade900, labelText: "Адрес", onTap: null,),
          SizedBox(
            height: 10,
          ),
        ],
      )),
      SizedBox(
        height: 10,
      ),
      SizedBox(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Сохранить данные"),
          style: ButtonStyle(backgroundColor:
              MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
            return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
          })),
        ),
        width: 300,
      ),
    ]);
  }
}
