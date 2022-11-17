import 'dart:convert';

import 'package:http/http.dart' as http;

class ImageWorker {
  final uri = 'https://smmon.slata.com/getOrder/go.php';
  Future<List<String>> getCouponsList() async {
    var url = Uri.parse(uri);
    var body = '''{
          "token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns",
          "id": "0",
          "name": "Vlad233",
          "card": "0",
          "email": "mavlsion@mail.ru",
          "password": "testing",
          "enter": "couponslist",
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

    var data = jsonDecode(response.body);
    List<String> result = [];

    for (var element in data) {
      result.add(element["pathFile"]);
    }
    print(result);
    return result;
  }

  Future<List<String>> getSalesList() async {
    var url = Uri.parse(uri);
    var body = '''{
          "token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns",
          "id": "0",
          "name": "Vlad233",
          "card": "0",
          "email": "mavlsion@mail.ru",
          "password": "testing",
          "enter": "saleslist",
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

    var data = jsonDecode(response.body);
    List<String> result = [];

    for (var element in data) {
      result.add(element["pathFile"]);
    }
    print(result);
    return result;
  }

  Future<List<String>> getCatalogImages() async {
    var url = Uri.parse(uri);
    var body = '''{
          "token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns",
          "id": "0",
          "name": "Vlad233",
          "card": "0",
          "email": "mavlsion@mail.ru",
          "password": "testing",
          "enter": "getcatalogimages",
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

    var data = jsonDecode(response.body);
    List<String> result = [];

    for (var element in data) {
      result.add(element["pathFile"]);
    }
    print(result);
    return result;
  }
}
