import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcg_project/models/loginModel.dart';
import 'package:tcg_project/utilities/shared_preferance.dart';

class UserProvider with ChangeNotifier{

  Future<bool> saveUser(LoginModel user) async {

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    sp.setString('refreshToken', user.refreshToken.toString());
    notifyListeners();
    return true ;
  }

  Future<LoginModel> getUser() async {

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    final String? refreshToken = sp.getString('refreshToken');
    return LoginModel(
        token: token.toString(),
        refreshToken: refreshToken.toString()
    );
  }

  Future<bool> remove()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;

  }
}