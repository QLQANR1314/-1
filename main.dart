import 'package:biyan_finance/MyApp.dart';
import 'package:biyan_finance/common/local_storage.dart';
import 'package:biyan_finance/providers/login_provider.dart';
import 'package:biyan_finance/providers/login_regist_provider.dart';
import 'package:biyan_finance/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => LoginRegistProvider()),
      ChangeNotifierProvider(create: (ctx) => LoginProvider()),
      ChangeNotifierProvider(create: (ctx) => UserProvider()),
    ],
    child: const MyApp(),
  ));
}
