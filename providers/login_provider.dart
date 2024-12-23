import 'package:biyan_finance/apis/loginapi.dart';
import 'package:biyan_finance/common/local_storage.dart';
import 'package:biyan_finance/common/toast_utils.dart';
import 'package:biyan_finance/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {

  late UserProvider userProvider;
  String email = "";

  String password = "";

  

  //  LoginProvider(BuildContext context) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
      
  //     userProvider = context.read<UserProvider>();
  //   });
  // }

  setEmail(String v) {
    email = v;
    notifyListeners();
  }

  setPassword(String v) {
    password = v;
    notifyListeners();
  }

  sendemailNext(BuildContext context) async {
    print("object---${email}-${password}");

    final userProvider = context.read<UserProvider>();

    Loginapi.login(email: email, password: password).then((value) {
      if (value.code != 1) {
        ToastUtils.showError(value.message ?? "Login failed");
        return;
      }

      print("object===${value.data!["token"]}");

      userProvider.setToken(value.data!["token"]);

      Navigator.of(context).pop();
    });
  }
}
