class LoginModel {
  String? token;
  String? refreshToken;

  LoginModel({this.token, this.refreshToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['token'] = this.token;
  //
  //   return data;
  // }
}