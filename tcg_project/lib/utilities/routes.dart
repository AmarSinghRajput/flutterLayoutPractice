import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcg_project/view/dashboard_page.dart';
import 'package:tcg_project/view/login_page.dart';

class RoutesName {
  static const String login = 'login_screen';
  static const String home = 'home_screen';
}

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => DashboardPage());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}