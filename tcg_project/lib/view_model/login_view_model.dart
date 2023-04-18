import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tcg_project/models/loginModel.dart';
import 'package:tcg_project/repository/login_repository.dart';
import 'package:tcg_project/utilities/helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcg_project/provider/user_provider.dart';
import 'package:tcg_project/utilities/routes.dart';

class LoginViewModel with ChangeNotifier {

  final _loginRepo = LoginRepository();
  bool _loading = false;
  String _errorMessage = "";
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _loginRepo.loginApi(data).then((value) {
      // print(value);
      setLoading(false);

      final userPreference = Provider.of<UserProvider>(context, listen: false);
      userPreference.saveUser(
          LoginModel(
              token: value['access_token'].toString(),
              refreshToken: value['refresh_token'].toString(),
          )
      );

      Helper.flushBarErrorMessage('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Helper.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}