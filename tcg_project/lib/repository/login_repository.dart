import 'dart:convert';
import 'package:http/http.dart';
import 'package:tcg_project/resources/app_url.dart';
import 'package:tcg_project/service/network_service.dart';


class LoginRepository  {

  NetworkService _apiServices = NetworkService() ;

  Future<dynamic> loginApi(dynamic data )async {
    try{
      var username = data['username'];
      var password = data['password'];
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPint, "username=$username&password=$password");
      return response ;
    }catch(e){
      throw e ;
    }
  }
}