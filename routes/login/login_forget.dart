import 'package:biyan_finance/widgets/btn.dart';
import 'package:biyan_finance/widgets/input.dart';
import 'package:flutter/material.dart';

class LoginForget extends StatefulWidget {
  const LoginForget({super.key});

  @override
  State<LoginForget> createState() => _LoginForgetState();
}

class _LoginForgetState extends State<LoginForget> {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top , right: 12, left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Text(
              "忘记密码",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "电子邮箱",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            
            const SizedBox(
              height: 44,
              child: Input(
                placeholder: "邮箱/手机号码(不含国际区号)",
              ),
            ),

            const SizedBox(height: 10),
            
            const SizedBox(
              height: 44,
              child: Input(
                placeholder: "请输入邮箱验证码",
              ),
            ),

            const SizedBox(height: 10),
            
            const SizedBox(
              height: 44,
              child: Input(
                placeholder: "请输入密码",
              ),
            ),

             
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Btn(
                onTap: () {},
                primary: Colors.black,
                child: const Text("确认"),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}