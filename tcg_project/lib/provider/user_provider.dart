import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcg_project/models/loginModel.dart';
import 'package:tcg_project/utilities/shared_preferance.dart';

class UserProvider with ChangeNotifier{

  Future<bool> saveUser(LoginModel user) async {

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true ;
  }

  Future<LoginModel> getUser()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return LoginModel(
        token: token.toString()
    );
  }

  Future<bool> remove()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;

  }
}