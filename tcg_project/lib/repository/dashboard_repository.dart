import '../resources/app_url.dart';
import '../service/network_service.dart';
import '../utilities/shared_preferance.dart';

class DashBoardRepository {
  NetworkService _apiServices = NetworkService() ;

  Future<dynamic> refreshTokenApi()async {
    try{
      String? refreshToken = await SharedPrefHelper.getData("refreshToken");
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.refreshTokenEndPint, "refresh_token=$refreshToken");
      return response ;
    }catch(e){
      throw e ;
    }
  }
}