import 'package:biyan_finance/routes/login/login_getcode.dart';
import 'package:biyan_finance/widgets/btn.dart';
import 'package:biyan_finance/widgets/input.dart';
import 'package:biyan_finance/widgets/navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginOther extends StatefulWidget {
  const LoginOther({super.key});

  @override
  State<LoginOther> createState() => _LoginOtherState();
}

class _LoginOtherState extends State<LoginOther> {
  final TextEditingController _phonecontroller = TextEditingController();

  bool agreeStreaming = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 15, right: 12, left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "登录",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "邮箱/手机号码",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            const SizedBox(
              height: 44,
              child: Input(
                  placeholder: "邮箱/手机号码(不含国际区号)",
                ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Btn(
                onTap: () async {
                  await Navigation.push(context: context, child: const LoginGetcode());
                },
                primary: Colors.black,
                child: const Text("下一步"),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                    
                    children: [
                      TextSpan(
                        text: "创建虎币账号",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            print("去创建");
                              Navigator.of(context).pop();
                          },
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
