import 'package:biyan_finance/routes/find/find.dart';
import 'package:biyan_finance/routes/home/home.dart';
import 'package:biyan_finance/routes/home_push/home_push.dart';
import 'package:biyan_finance/routes/my/my.dart';
import 'package:biyan_finance/routes/quotation/quotation.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  late int _currentIndex = 0;


  void onTabAction(int index) {


    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getPage(index) {
    final List<Widget> _pages = <Widget>[
      const HomePush(),
      // const Home(),
      // const Quotation(),
      // const Find(),
      const My(),
    ];
    return _pages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabAction,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
          // BottomNavigationBarItem(label: '行情', icon: Icon(Icons.home)),
          // BottomNavigationBarItem(label: '新闻', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: '设置', icon: Icon(Icons.admin_panel_settings)),
        ],
        // 激活颜色
        selectedItemColor: Colors.black,
      ),
    );
  }
}
