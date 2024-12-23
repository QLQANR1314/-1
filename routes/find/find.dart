import 'package:biyan_finance/routes/find/circle/find_circle.dart';
import 'package:biyan_finance/routes/find/journalism/find_journalism.dart';
import 'package:biyan_finance/routes/find/newsflash/find_newsflash.dart';
import 'package:flutter/material.dart';

class Find extends StatefulWidget {
  const Find({super.key});

  @override
  State<Find> createState() => _FindState();
}

class _FindState extends State<Find> with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "推荐",
    "快讯",
    "新闻",
   
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
                            labelPadding:const EdgeInsets.only(left: 10,right: 10),

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
                  FindCircle(),//圈子
                  FindNewsflash(),//快讯
                  FindJournalism(),//聚焦

             
                ],
              ),
            ),
          ],
        )
        
        );
  }
}
