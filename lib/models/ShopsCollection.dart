import 'Shop.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ShopsCollection {
  List<Shop> shopsCollection = [];

  ShopsCollection() {
    initShopCollection();
  }

  void initShopCollection() {
    shopsCollection.add(Shop("г. Иркутск, ул. 2-я Железнодорожная, д. 68",
        Point(latitude: 52.278268, longitude: 104.25006)));

    shopsCollection.add(Shop("г. Иркутск, бульвар Рябикова, 23",
        Point(latitude: 52.261893, longitude: 104.21337)));

    shopsCollection.add(Shop("г. Иркутск, ул. Клары Цеткин, 12/1",
        Point(latitude: 52.277707, longitude: 104.254075)));

    shopsCollection.add(Shop("г. Иркутск, мкр. Березовый, 5А",
        Point(latitude: 52.225563, longitude: 104.253116)));

    shopsCollection.add(Shop("г. Иркутск, мкр. Берёзовый, д. 115",
        Point(latitude: 52.218781, longitude: 104.244694)));

    shopsCollection.add(Shop("г. Иркутск, мкр. Университетский, 41",
        Point(latitude: 52.255176, longitude: 104.248347)));

    shopsCollection.add(Shop("г. Иркутск, мкр. Университетский, 96",
        Point(latitude: 52.249021, longitude: 104.2472)));

    shopsCollection.add(Shop("г. Иркутск, пер. 15-й Советский, 4",
        Point(latitude: 52.347429, longitude: 104.177528)));

    shopsCollection.add(Shop("г. Иркутск, ул. Пискунова, 100",
        Point(latitude: 52.270297, longitude: 104.317131)));

    shopsCollection.add(Shop("г. Иркутск, пр. Юрия Тена 25",
        Point(latitude: 52.253164, longitude: 104.260059)));

    shopsCollection.add(Shop("г. Иркутск, ул Индустриальная, д. 16",
        Point(latitude: 52.234061, longitude: 104.27439)));

    shopsCollection.add(Shop("г. Иркутск, ул. Авиастроителей, 65",
        Point(latitude: 52.357749, longitude: 104.212917)));

    shopsCollection.add(Shop("г. Иркутск, ул. Байкальская, 342 А",
        Point(latitude: 52.253214, longitude: 104.360543)));

    shopsCollection.add(Shop("г. Иркутск, ул. Байкальская. д. 155А",
        Point(latitude: 52.260826, longitude: 104.321305)));

    shopsCollection.add(Shop("г. Иркутск, ул. Баррикад. д. 90",
        Point(latitude: 52.291632, longitude: 104.349704)));

    shopsCollection.add(Shop("г. Иркутск, ул. Бородина, 56",
        Point(latitude: 52.223553, longitude: 104.314068)));

    shopsCollection.add(Shop("г. Иркутск, ул. Волжская, 33",
        Point(latitude: 52.26597, longitude: 104.321024)));

    shopsCollection.add(Shop("г. Иркутск, ул. Гоголя, 104",
        Point(latitude: 52.267629, longitude: 104.259234)));

    shopsCollection.add(Shop("г. Иркутск, ул. Красноказачья 119",
        Point(latitude: 52.268083, longitude: 104.329581)));

    shopsCollection.add(Shop("г. Иркутск, ул. Красноярская, д. 71а/1",
        Point(latitude: 52.272339, longitude: 104.330421)));

    shopsCollection.add(Shop("г. Иркутск, ул. Лермонтова, 275/6",
        Point(latitude: 52.251225, longitude: 104.27379)));

    shopsCollection.add(Shop("г. Иркутск, ул. Лыткина, 42а",
        Point(latitude: 52.26821, longitude: 104.319964)));

    shopsCollection.add(Shop("г. Иркутск, ул. Пискунова 140/6",
        Point(latitude: 52.27233, longitude: 104.335671)));

    shopsCollection.add(Shop("г. Иркутск, ул. Поленова, д.4",
        Point(latitude: 52.285827, longitude: 104.314431)));

    shopsCollection.add(Shop("г. Иркутск, ул. Р.Люксембург, 293",
        Point(latitude: 52.354723, longitude: 104.156041)));

    shopsCollection.add(Shop("г. Иркутск, ул. Семена Лагоды, 4/6",
        Point(latitude: 52.261072, longitude: 104.302044)));

    shopsCollection.add(Shop("г. Иркутск, ул. Сибирских партизан, 1 \"А\"",
        Point(latitude: 52.345149, longitude: 104.22586)));

    shopsCollection.add(Shop("г. Иркутск, ул. Тельмана, 38/1",
        Point(latitude: 52.33426, longitude: 104.201209)));

    shopsCollection.add(Shop("г. Иркутск, Юбилейный 42",
        Point(latitude: 52.222645, longitude: 104.302367)));

    shopsCollection.add(Shop("г.Иркутск мкр.Радужный, д.114",
        Point(latitude: 52.23255, longitude: 104.276664)));

    shopsCollection.add(Shop("г.Иркутск, Баумана 229/3а",
        Point(latitude: 52.34964, longitude: 104.156509)));

    shopsCollection.add(Shop("г.Иркутск, кв-л. Стрижи,11",
        Point(latitude: 52.250285, longitude: 104.226772)));

    shopsCollection.add(Shop("г.Иркутск, Ледовского 7",
        Point(latitude: 52.339421, longitude: 104.201328)));

    shopsCollection.add(Shop("г.Иркутск, мкр.Первомайский, 14А",
        Point(latitude: 52.260729, longitude: 104.241369)));

    shopsCollection.add(Shop("г.Иркутск, мкр.Первомайский, 54/2",
        Point(latitude: 52.253597, longitude: 104.233782)));

    shopsCollection.add(Shop("г.Иркутск, мкр.Юбилейный,17",
        Point(latitude: 52.227511, longitude: 104.298909)));

    shopsCollection.add(Shop("г.Иркутск, ул. Гражданская, 47",
        Point(latitude: 52.352131, longitude: 104.21175)));

    shopsCollection.add(Shop("г.Иркутск, ул. Украинская,10",
        Point(latitude: 52.350753, longitude: 104.222321)));

    shopsCollection.add(Shop("г.Иркутск, ул.Баррикад, 54-5",
        Point(latitude: 52.291127, longitude: 104.327126)));

    shopsCollection.add(Shop("г.Иркутск, ул.Рабоче-Крестьянская, 3Б",
        Point(latitude: 52.330957, longitude: 104.195923)));

    shopsCollection.add(Shop("Иркутск , Байкальская 234 А",
        Point(latitude: 52.25424, longitude: 104.325155)));

    shopsCollection.add(Shop("Иркутск, Костычева, 27-1",
        Point(latitude: 52.231175, longitude: 104.282536)));

    shopsCollection.add(Shop("Иркутский район, Байкальский тракт, д. 9/1",
        Point(latitude: 52.253036, longitude: 104.392918)));

    shopsCollection.add(Shop("п. Молодежный, Солнечная, 1",
        Point(latitude: 52.23806, longitude: 104.424595)));

    shopsCollection.add(Shop("с. Новонукутский, ул. Хангалова, 2 А",
        Point(latitude: 53.701265, longitude: 102.70446)));
  }

  List<Shop> getShopsCollection(){
    return shopsCollection;
  }
}
