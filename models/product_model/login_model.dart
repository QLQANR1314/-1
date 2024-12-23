class LoginModel {
  int? code;
  String? message;
  Map? data;

  LoginModel({this.code, this.message, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: json['data'] as Map?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'mmessagesg': message,
        'data': data,
      };
}