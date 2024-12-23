import 'package:biyan_finance/apis/homeapi.dart';
import 'package:biyan_finance/models/product_model/home_tweets_model.dart';
import 'package:biyan_finance/routes/home_push/push/push_index.dart';
import 'package:flutter/material.dart';

class HomePush extends StatefulWidget {
  const HomePush({super.key});

  @override
  State<HomePush> createState() => _HomePushState();
}

class _HomePushState extends State<HomePush>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "最新消息",
  ];
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
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  PushIndex(),
                ],
              ),
            ),
          ],
        ));
  }
}
