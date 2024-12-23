class LoginRegistModel {
  int? code;
  String? msg;
  Map? data;

  LoginRegistModel({this.code, this.msg, this.data});

  factory LoginRegistModel.fromJson(Map<String, dynamic> json) =>
      LoginRegistModel(
        code: json['code'] as int?,
        msg: json['msg'] as String?,
        data: json['data'] as Map?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'data': data,
      };
}

class RegistEmailModel {
  int? code;
  String? msg;
  Map? data;

  RegistEmailModel({
    this.code,
    this.msg,
    this.data,
  });

  factory RegistEmailModel.fromJson(Map<String, dynamic> json) =>
      RegistEmailModel(
        code: json['code'] as int?,
        msg: json['msg'] as String?,
        data: json['data'] as Map?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'data': data,
      };
}
