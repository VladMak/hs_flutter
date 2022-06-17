import 'package:http/http.dart' as http;

class Api {
  Future<void> registration() async {
    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

    var response = await http.post(url,
        body:
            '{"token":"jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "aecd49c9-70c3-4aef-8c68-ce5bc54005ad","name": "Член","card": "123124","email": "xyu@123", "password": "sdf", "enter": false}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  Future<void> login() async {
    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

    var response = await http.post(url,
        body:
            '{"token":"jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "aecd49c9-70c3-4aef-8c68-ce5bc54005ad","name": "Член","card": "123124","email": "xyu@123", "password": "sdf", "enter": true}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }
}
