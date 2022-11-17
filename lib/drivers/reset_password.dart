import 'dart:convert';

import 'package:http/http.dart' as http;

/**
 * Функция принимает путь и адрес электронной почты.
 * Возвращает код, который отправлен на почту. Клиент должен подтвердить, что почта принадлежит ему.
 */
Future<String> resetPassword(
    {path = "https://smmon.slata.com/getOrder/go.php", email}) async {
  print(email);
  var url = Uri.parse(path);
  var body = '''{
          "token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns",
          "id": "0",
          "name": "Vlad233",
          "card": "0",
          "email": "${email}",
          "password": "testing",
          "enter": "resetpassword",
          "userToken": "e98876cd-52a0-4117-87ef-6e61f9ae7422",
          "level": 0,
          "nextLevel": 0,
          "sumShop": 0.0,
          "countBonus": 0.0,
          "firstname": "Vladislav",
          "secondname": "Makarov",
          "surname": "Alexandrovich"
      }''';
  var response = await http.post(url, body: body);
  if (response.statusCode != 200) throw Exception("ERROR");
  String data = response.body;
  return data;
}

Future<String> updatePassword(
    {path = "https://smmon.slata.com/getOrder/go.php", email, password}) async {
  var url = Uri.parse(path);
  var body = '''{
          "token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns",
          "id": "0",
          "name": "Vlad233",
          "card": "0",
          "email": "${email}",
          "password": "${password}",
          "enter": "updatepassword",
          "userToken": "e98876cd-52a0-4117-87ef-6e61f9ae7422",
          "level": 0,
          "nextLevel": 0,
          "sumShop": 0.0,
          "countBonus": 0.0,
          "firstname": "Vladislav",
          "secondname": "Makarov",
          "surname": "Alexandrovich"
      }''';
  var response = await http.post(url, body: body);
  if (response.statusCode != 200) throw Exception("ERROR");
  String data = response.body;
  return data;
}
