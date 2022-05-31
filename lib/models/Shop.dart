import 'package:yandex_mapkit/yandex_mapkit.dart';

class Shop {

  late String address;
  late Point coordinates;

  Shop(String address, Point coordinates){
    this.address = address;
    this.coordinates = coordinates;
  }

}