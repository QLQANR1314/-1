

import 'package:biyan_finance/models/product_model/login_model.dart';
import 'package:biyan_finance/models/product_model/login_regist_model.dart';
import 'package:biyan_finance/utils/by_http.dart';

class Loginapi {


  static Future<LoginRegistModel> regist({String? email}) async {

    
    var res = await ByHttpUtil().post('/register/emailCode',data:{
      "email":email
    }, params: {});
    

    return LoginRegistModel.fromJson(res.data);
  }


  static Future<LoginRegistModel> registLogin({String? email,String? code,String? password,String? sourcemember,String? keyStr}) async {

     print("res===${email}=${code}=${password}=${sourcemember}=${keyStr}");
    var res = await ByHttpUtil().post('/register/email',data:{
      "email":email,
      "code" :code,
      "password":password,
    
      "key":keyStr

    }, params: {});
    

    return LoginRegistModel.fromJson(res.data);
  }


    static Future<LoginModel> login({String? email,String? password}) async {

    
    var res = await ByHttpUtil().post('/login/email_login',data:{
      "email":email,
      "password":password,
      "client":"ios"
    }, params: {});
    

    return LoginModel.fromJson(res.data);
  }


  
  
}