import 'package:biyan_finance/common/local_storage.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? token = LocalStorage.get("token");

  setToken(String v) {


    print("v=====${v}");
    token = v;
    LocalStorage.set("token", v);
  }
}
