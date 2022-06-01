import 'package:http/http.dart' as http;

class Api {
  Future<void> test() async {
    print("HUI");
    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

    var response = await http.post(url,
        body:
            '{"token":"jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "123","name": "Дима","card": "123123","email": "qwer@123"}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }
}
