import 'package:biyan_finance/routes/login/login.dart';
import 'package:biyan_finance/routes/login/login_other.dart';
import 'package:biyan_finance/widgets/btn.dart';
import 'package:biyan_finance/widgets/navigation.dart';
import 'package:flutter/material.dart';

class My extends StatefulWidget {
  const My({super.key});

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 15, left: 8, right: 8),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "设置",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "个人中心",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "投资组合",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "悬浮窗设置",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "主题设置",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "颜色设置",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "语言设置",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "分享App",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "联系我们",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "检查更新",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SizedBox(
              width: double.infinity,
              child: Btn(
                onTap: () async {
                  await Navigation.push(context: context, child: const Login());
                },
                primary: Colors.black,
                child: const Text("登录"),
              ),
            ),
            
          ),
        ],
      ),
    ));

  }
}
