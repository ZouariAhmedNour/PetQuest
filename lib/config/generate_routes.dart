import 'package:get/get.dart';
import 'package:petquest/auth/login.dart';
import 'package:petquest/auth/signup.dart';
import 'package:petquest/config/app_routes.dart';
import 'package:petquest/home.dart';

class GenerateRoutes {
  static List<GetPage> getPages() {
    return [ 
      GetPage(name: AppRoutes.login, page: () => Login()),
      GetPage(name: AppRoutes.signup, page: () => Signup()),
      GetPage(name : AppRoutes.home, page: () => Home()),
    ];
  }
}
