import 'package:biyan_finance/routes/home/home_details/information/home_details_home_information.dart';
import 'package:biyan_finance/routes/home/home_details/square/home_details_square.dart';
import 'package:biyan_finance/routes/home/home_details/transaction_data/home_details_transaction_data.dart';
import 'package:flutter/material.dart';

class HomeDetailsMain extends StatefulWidget {
  const HomeDetailsMain({super.key});

  @override
  State<HomeDetailsMain> createState() => _HomeDetailsMainState();
}

class _HomeDetailsMainState extends State<HomeDetailsMain>
    with SingleTickerProviderStateMixin {
  List<String> tabs = ["信息", "交易数据", "广场"];
  late TabController _tabController;


  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "BTC/USDT",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(icon: Icon(Icons.add), onPressed: () {}),
          ],
          bottom: TabBar(
              isScrollable: true, //导航栏及页面是否可以滚动
              tabAlignment: TabAlignment.start,
              labelColor: Colors.black,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold),
              controller: _tabController,
              indicatorColor: Colors.black,
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: tabs.map((e) {
                return Tab(
                  text: e,
                );
              }).toList()),
        ),
        body: Column(
          children: [
            
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  HomeDetailsHomeInformation(),
                  HomeDetailsTransactionData(),
                  HomeDetailsSquare(),
             
                ],
              ),
            ),
          ],
        ));
  }
}


  
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Padding(
  //       padding: EdgeInsets.only(
  //           top: MediaQuery.of(context).padding.top + 15, right: 12, left: 12),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             children: [
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Icon(
  //                   Icons.close,
  //                   size: 20,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 8,
  //               ),
  //               Row(
                  
  //                 children: [
  //                   Image.asset(
  //                     "assets/home/${"line-bitcoin"}.png",
  //                     width: 30,
  //                     height: 30,
  //                     fit: BoxFit.cover,
  //                   ),
  //                   const Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         "BTC",
  //                         style: TextStyle(fontWeight: FontWeight.bold),
  //                       ),
  //                       Text(
  //                         "比特币,Bitcoin",
  //                         style: TextStyle(fontSize: 14, color: Colors.grey),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               )
  //             ],
  //           ),
  //           const SizedBox(height: 40),
  //           const Text(
  //             "验证您的电话号码",
  //             style: TextStyle(
  //               fontSize: 24,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.black,
  //             ),
  //           ),
  //           const SizedBox(height: 10),
  //           const Text(
  //             "请输入手机+xxxxxxxxxx收到的6位验证码",
  //             style: TextStyle(
  //               fontSize: 14,
  //               color: Colors.grey,
  //             ),
  //           ),
  //           const Text(
  //             "验证码30分钟有效",
  //             style: TextStyle(
  //               fontSize: 14,
  //               color: Colors.grey,
  //             ),
  //           ),
  //           const SizedBox(height: 5),
  //           const SizedBox(
  //             height: 44,
  //             child: Input(
  //               placeholder: "邮箱/手机号码(不含国际区号)",
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 5,
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
// }
