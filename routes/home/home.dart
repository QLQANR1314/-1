
import 'package:biyan_finance/routes/home/chart/home_chart_index.dart';
import 'package:biyan_finance/routes/home/market/home_market_index.dart';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "市场",
    "图表",
  ];
  late TabController _tabController;


  // 定义原始数据
  List<String> items = [
    "1",
    "1",
    "1",
    "1",
  ];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

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
                child: Row(
                  children: [
                    Expanded(
                      child: TabBar(
                          isScrollable: true, //导航栏及页面是否可以滚动
                          labelPadding:
                              const EdgeInsets.only(left: 10, right: 10),
                          tabAlignment: TabAlignment.start,
                          labelColor: Colors.black,
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          unselectedLabelColor: Colors.grey,
                          unselectedLabelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          controller: _tabController,
                          dividerHeight: 0,
                          
                          tabs: tabs.map((e) {
                            return Tab(
                              text: e,
                            );
                          }).toList()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),

      body: Column(
          children: [
   
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                    HomeMarketIndex(),//市场
                    HomeChartIndex()//图表

             
                ],
              ),
            ),
          ],
        )


     
    );
  }
}
