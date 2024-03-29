import 'package:flutter/material.dart';

class UserAgreement extends StatelessWidget {
  UserAgreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                Container(
                  child: Image(image: AssetImage("assets/logo.png")),
                  padding: EdgeInsets.all(5),
                )
              ],
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                "Отказ от бумажных чеков",
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
            body: Cancelation()),
        onWillPop: () async {
          return true;
        });
  }
}

class Cancelation extends StatelessWidget {
  const Cancelation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Text(
            "Правила при согласии на отказ от печати бумажных чеков",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Container(
          child: Text(
              """Активировав функцию “Отказ от печати бумажного чека”, Вы подтверждаете, что отказались от печати бумажных чеков на кассе при совершении покупок в дискаунтерах “Хлеб Соль” и согласны получать их в электронном виде на указанный Вами адрес электронной почты в личном кабинете мобильного приложения «Хлеб соль». Чеки в электронном виде будут направляться Вам “Оператором фискальных данных” ("ОФД")."""),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """1. При каждой покупке, оплаченной при помощи банковского терминала, будет распечатан бумажный материал, содержащий информацию об оплате и совершенной операции.""",
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """1. При каждой покупке, оплаченной при помощи банковского терминала, будет распечатан бумажный материал, содержащий информацию об оплате и совершенной операции.""",
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """2. Период доставки электронного чека составляет до нескольких часов.""",
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """3. По умолчанию способом получения чека является отправка электронного чека на указанный Вами адрес электронной почты в личном кабинете мобильного приложения «Хлеб соль».""",
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """4. В случае, если Вы хотите изменить реквизиты получения электронного чека в момент покупки, до момента оплаты сообщите об этом кассиру или выберите необходимый пункт на кассе самообслуживания и сообщите/укажите Email. Указание реквизитов для получения электронного чека также возможно при помощи предъявления QR-кода из официального приложения "Проверка чека" от ФНС РФ. Электронный чек будет отправлен на указанные реквизиты и распечатан на кассе в бумажном виде. Изменение реквизитов получения электронного чека в момент покупки распространяется только на совершаемую покупку.""",
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """5. Вы можете изменить Email для получения электронных чеков в личном кабинете мобильного приложения «Хлеб соль». При этом Вам необходимо снова отказаться от печати бумажных чеков после подтверждения измененного Email""",
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """6. Если Вам понадобится бумажный чек в момент совершения покупки, Вы можете обратиться к кассиру до момента оплаты о необходимости распечатать бумажный чек. На кассе самообслуживания активировать печать чека возможно при помощи выбора соответствующего пункта на экране. Печать бумажного чека по запросу распространяется только на совершаемую покупку. Электронный чек будет отправлен на указанный Вами адрес электронной почты в личном кабинете мобильного приложения «Хлеб соль»""",
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """7. Информация о составе чека, примененных в составе чека скидках и т.д. также будет доступна в личном кабинете мобильного приложения «Хлеб соль».""",
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """8. Функцию “ Отказ от печати бумажного чека” можно отключить в личном кабинете мобильного приложения «Хлеб соль» в любой момент и продолжить получать бумажные чеки на кассе магазина при совершении покупки.""",
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
      ],
    );
  }
}
