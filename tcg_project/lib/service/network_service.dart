import 'package:http/http.dart' as http;
import 'data/app_exceptions.dart';
import 'dart:convert';
import 'dart:io';

class NetworkService {

  Future getGetApiResponse(String url) async {
    dynamic responseJson ;

    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {

      throw FetchDataException('No Internet Connection');
    }

    return responseJson;

  }

  Future getPostApiResponse(String url , dynamic data) async {

    dynamic responseJson ;
    try {
      print(data);
      http.Response response = await http.post(
          Uri.parse(url),
          body: data,
          headers: {'Content-Type': 'text/plain'},
      ).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    }on SocketException {

      throw FetchDataException('No Internet Connection');
    }

    return responseJson ;
  }

  dynamic returnResponse (http.Response response){
    print(response.statusCode);
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occurred while communicating with server' +
            'with status code' +response.statusCode.toString());
    }
  }
}

