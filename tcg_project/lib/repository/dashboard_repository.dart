import '../resources/app_url.dart';
import '../service/network_service.dart';

class DashBoardRepository {
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