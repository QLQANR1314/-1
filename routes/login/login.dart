
import 'package:biyan_finance/providers/login_provider.dart';
import 'package:biyan_finance/routes/login/login_forget.dart';
import 'package:biyan_finance/routes/login/login_getcode.dart';
import 'package:biyan_finance/routes/login/login_register.dart';
import 'package:biyan_finance/widgets/btn.dart';
import 'package:biyan_finance/widgets/input.dart';
import 'package:biyan_finance/widgets/navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  bool agreeStreaming = false;


   

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 38,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: RichText(
              text: TextSpan(
                text: "注册",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
        

                     await Navigation.push(
                      context: context, child: const LoginRegister());
                  },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 15, right: 12, left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "欢迎回来!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "电子邮箱",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 44,
              child: Input(
                placeholder: "邮箱/手机号码(不含国际区号)",

                onChanged: (v) => loginProvider.setEmail(v),

                
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             SizedBox(
              height: 44,
              child: Input(
                placeholder: "请输入密码",
                onChanged: (v) => loginProvider.setPassword(v),
              ),
            ),
       
            const SizedBox(height: 20),

            RichText(
              text: TextSpan(
                text: "忘记密码",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    print("忘记密码");

                    await Navigation.push(
                      context: context, child: const LoginForget());
                  },
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            SizedBox(
              width: double.infinity,
              child: Btn(
                onTap: () async {
                  // await Navigation.push(
                  //     context: context, child: const LoginGetcode());

                  loginProvider.sendemailNext(context);
                },
                primary: Colors.black,
                child: const Text("登录"),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
