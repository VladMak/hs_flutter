import 'package:postgres/postgres.dart';
import 'package:http/http.dart';

class Db {
  Future<void> testConnect() async {
    var connection = PostgreSQLConnection("192.168.1.102", 5432, "postgres",
        username: "postgres", password: "");
    await connection.open();

    List<List<dynamic>> results = await connection.query(
        "select oid, datname from pg_database limit @aValue;",
        substitutionValues: {"aValue": 3});

    for (final row in results) {
      var a = row[0];
      var b = row[1];
      print(a);
      print(b);
    }
  }
}
