import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Mailer {
  String name = 'mavlsion@mail.ru';
  String password = 'fe16tDCv4q4ZFCLHbtC3';

  Future<void> sendMy() async {
    final smtpServer = SmtpServer('smtp.mail.ru',
        port: 465, username: this.name, password: this.password);

    final message = Message()
      ..from = Address(name, 'Test')
      ..recipients.add('mymail@mail.ru')
      ..subject = "TEST"
      ..text = "MEssage"
      ..html = "<h1>SDF</h1>";

    /*try {
      final sendReport = await send(message, smtpServer);
      print("Message sent: " + sendReport.toString());
    } on MailerException catch (e) {
      print("Message not sent");
      for (var p in e.problems) {
        print("Problem: ${p.code}: {$p.msg}");
      }
    }*/

    var connection = PersistentConnection(smtpServer);
    await connection.send(message);
    await connection.close();
  }
}
