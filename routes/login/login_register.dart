import 'package:biyan_finance/providers/login_regist_provider.dart';
import 'package:biyan_finance/widgets/btn.dart';
import 'package:biyan_finance/widgets/input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool agreeStreaming = false;
  @override
  Widget build(BuildContext context) {
    final registProvider = Provider.of<LoginRegistProvider>(context);

    final sendCode = registProvider.sendemailNext;

    final isEmpty = registProvider.email.isEmpty;
    final isSendingEmail = registProvider.isSendingEmail;
    final disabled = isEmpty || isSendingEmail;

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
              top: MediaQuery.of(context).padding.top, right: 12, left: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "注册",
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
                SizedBox(
                  height: 44,
                  child: Input(
                    placeholder: "请输入邮箱账号",
                    onChanged: (v) => registProvider.setEmail(v),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 230,
                      height: 44,
                      child: Input(
                        placeholder: "请输入邮箱验证码",
                        onChanged: (v) => registProvider.setEmailcode(v),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                        
                          sendCode(context);
                        },
                        child: const Text(
                          "发送验证码",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 44,
                  child: Input(
                    placeholder: "请输入密码",
                    onChanged: (v) => registProvider.setPassword(v),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 44,
                  child: Input(
                    placeholder: "请输入邀请码(选填)",
                    onChanged: (v) => registProvider.setinvitationCode(v),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          agreeStreaming = !agreeStreaming;
                        });
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: agreeStreaming
                            ? const Icon(Icons.check_circle,
                                size: 18, color: Colors.black)
                            : const Icon(Icons.radio_button_unchecked,
                                size: 18, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Expanded(
                        child: RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 20, 153, 129)),
                                children: [
                          const TextSpan(
                              text: "我同意",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: "服务条款"),
                          const TextSpan(
                              text: "、", style: TextStyle(color: Colors.black)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: "风险与合规披露"),
                          const TextSpan(
                              text: "及", style: TextStyle(color: Colors.black)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: "隐私政策声明"),
                        ])))
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Btn(
                    onTap: () {

                      registProvider.login(context);
                    },
                    primary: Colors.black,
                    child: const Text("下一步"),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
