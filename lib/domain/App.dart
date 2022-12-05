import 'package:flutter/cupertino.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/Catalog.dart';
import 'package:myapp/views/Contacts.dart';
import 'package:myapp/views/CouponItem.dart' as ci;
import 'package:myapp/views/Coupons.dart';
import 'package:myapp/views/ForgotPassword.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/LoginSignupPage.dart';
import 'package:myapp/views/PersonalDataProtection.dart';
import 'package:myapp/views/Sales.dart';
import 'package:myapp/views/Map.dart' as M;
import 'package:myapp/views/UserAgreement.dart';

class App {
  Map<String, Widget Function(BuildContext)> Routes = {
    '/coupons': (context) => Coupons(),
    '/home': (context) => Home(),
    '/contacts': (context) => Contacts(),
    '/login': (context) => LoginSignupPage(),
    '/cabinet': (context) => Cabinet(),
    '/promotion': (context) => Sales(),
    '/shop': (context) => M.Map(),
    '/catalog': (context) => Catalog(),
    //'/couponItem': (context) => ci.CouponItemN(),
    '/personalDataProtection': (context) => PersonalDataProtection(),
    '/userAgreement': (context) => UserAgreement(),
    '/forgotPassword': (context) => ForgotPassword()
  };
  String CouponId = "";
}
