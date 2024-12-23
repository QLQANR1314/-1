import 'package:biyan_finance/widgets/btn.dart';
import 'package:biyan_finance/widgets/input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginGetcode extends StatefulWidget {
  const LoginGetcode({super.key});

  @override
  State<LoginGetcode> createState() => _LoginGetcodeState();
}

class _LoginGetcodeState extends State<LoginGetcode> {
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
              "验证您的电话号码",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "请输入您在手机手机+xxxxxxxxxx收到的6位验证码",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "验证码30分钟有效。",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "验证码",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const SizedBox(
              height: 44,
              child: Input(
                placeholder: "填写验证码",
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            
            SizedBox(
              width: double.infinity,
              child: Btn(
                onTap: () {},
                primary: Colors.black,
                child: const Text("下一步"),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "未收到验证码?",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          print("未收到验证码");

                        
                        },
                    ),
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
