class LoginUserModel {
  int? code;
  String? message;
  user_infoModel? data;

  LoginUserModel({this.code, this.message, this.data});

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: json['data'] as user_infoModel?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'mmessagesg': message,
        'data': data,
      };
}

class user_infoModel {
  String? token;
  Map? data;

  user_infoModel({this.token, this.data});

  user_infoModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    data = json['member_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['member_info'] = data;
    return data;
  }
}
