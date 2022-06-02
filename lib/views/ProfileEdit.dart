import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/CustomTextFields.dart';

// Класс странички редактирования профиля
class ProfileEdit extends StatelessWidget {
  ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            if (Platform.isIOS)
              print("Тестим iphone");
            else
              print("Тестим android");
            return true;
          }
        });
  }
}

// Класс для построения списка параметров профиля
class MyDataList extends StatefulWidget {
  MyDataList({Key? key}) : super(key: key);

  @override
  State<MyDataList> createState() => MyDataListState();
}

final keyCalendarTextField = GlobalKey<TextFieldItemState>();

class MyDataListState extends State<MyDataList> {
  String _selectedDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  // Метод для создания визуального блока параметров
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

  // Метод для рисования календаря
  Future<void> _selectDate(BuildContext context, String selectedDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        // Устанавливаем русский язык календаря
        locale: const Locale("ru", "RU"),
        // В качестве текущей берём дату, установленную в поле
        initialDate: DateFormat("dd-MM-yyyy").parse(
            keyCalendarTextField.currentState!.widget.textController.text),
        firstDate: DateTime(1900, 1, 1),
        lastDate: DateTime(2101),
        // Тема календаря
        builder: (BuildContext context, Widget? child) {
          return Theme(
            child: child as Widget,
            data: ThemeData.light().copyWith(
                primaryColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
                colorScheme: ColorScheme.light(
                    primary: const Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10))),
          );
        });
    // Обработка выбора значения даты
    if (picked != null && picked != selectedDate) {
      keyCalendarTextField.currentState!.widget.textController.text =
          DateFormat("dd-MM-yyyy").format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Выводим список всех данных профиля
    return Column(children: <Widget>[
      _addContainer(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Личные данные",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            TextFieldItem(
              value: "Иванов",
              focusColor: Colors.red.shade900,
              labelText: "Фамилия",
              onTap: () {},
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldItem(
              value: "Иван",
              focusColor: Colors.red.shade900,
              labelText: "Имя",
              onTap: () {},
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldItem(
              value: "Иванович",
              focusColor: Colors.red.shade900,
              labelText: "Отчество",
              onTap: () {},
            ),
            SizedBox(
              height: 10,
            ),
            DropDownTextField(
              items: ["Мужской", "Женский"],
              readOnly: true,
              focusColor: Colors.red.shade900,
              labelText: "Пол",
              onTap: () {},
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldItem(
              key: keyCalendarTextField,
              readOnly: true,
              value: _selectedDate,
              focusColor: Colors.red.shade900,
              labelText: "Дата рождения",
              onTap: () {
                _selectDate(context, _selectedDate);
              },
            ),
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
          TextFieldItem(
            focusColor: Colors.red.shade900,
            labelText: "Электронная почта",
            onTap: () {},
          ),
          SizedBox(
            height: 10,
          ),
          TextFieldItem(
            focusColor: Colors.red.shade900,
            labelText: "Мобильный телефон",
            onTap: () {},
          ),
          SizedBox(
            height: 10,
          ),
          TextFieldItem(
            focusColor: Colors.red.shade900,
            labelText: "Город",
            onTap: () {},
          ),
          SizedBox(
            height: 10,
          ),
          TextFieldItem(
            focusColor: Colors.red.shade900,
            labelText: "Адрес",
            onTap: () {},
          ),
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