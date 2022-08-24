class Point{

  double latitude;
  double longitude;

  Point({required this.latitude, required this.longitude});
}

class Shop {

  late String address;
  late Point coordinates;

  Shop(String address, Point coordinates){
    this.address = address;
    this.coordinates = coordinates;
  }

}