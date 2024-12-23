import 'package:biyan_finance/routes/quotation/contract/contract_index.dart';
import 'package:biyan_finance/routes/quotation/existing/existing_index.dart';
import 'package:flutter/material.dart';

class Quotation extends StatefulWidget {
  const Quotation({super.key});

  @override
  State<Quotation> createState() => _QuotationState();
}

class _QuotationState extends State<Quotation>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "合约",
    "现货",
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
                            // indicatorColor: Colors.white,
                            // indicatorWeight: 0,
                            // indicatorSize: TabBarIndicatorSize.label,
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
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const [
                  ContractIndex(), //合约
                  ExistingIndex(), //现货
                ],
              ),
            ),
          ],
        ));
  }
}

// import 'package:biyan_finance/routes/home/home_type/home_itme.dart';
// import 'package:biyan_finance/routes/platform/platform_type/platform_type.dart';
// import 'package:flutter/material.dart';

// class Platform extends StatefulWidget {
//   const Platform({super.key});

//   @override
//   State<Platform> createState() => _PlatformState();
// }

// class _PlatformState extends State<Platform> with SingleTickerProviderStateMixin{

//   List<String> tabs = ["自选", "市值排名", "期货", "期权", "热搜榜", "新币动"];
//   late TabController _tabController;
  // final _controller = TextEditingController();
  // final _focusNode = FocusNode();

//   @override
//   void initState() {
//     _tabController = TabController(length: tabs.length, vsync: this);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       backgroundColor: Colors.white,
//         appBar: AppBar(
          
//           title: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: const Color(0xFFEEEEEE),
//                       borderRadius: BorderRadius.circular(6)),
//                   height: 38,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: 
// TextField(
//                           onChanged: (value) {},
//                           onSubmitted: (v) {},
//                           textInputAction: TextInputAction.search,
//                           decoration: const InputDecoration(
//                             contentPadding: EdgeInsets.only(bottom: 12),
//                             hintText: "搜索币总、交易所、资讯、行情分析",

//                             hintStyle: TextStyle(
//                                 fontSize: 14,
//                                 color: Color(0xFF888888),
//                                 fontWeight: FontWeight.normal),
//                             border: InputBorder.none,
//                             // focusedBorder: InputBorder.none,
//                           ),
//                           focusNode: _focusNode,
//                           controller: _controller,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           backgroundColor: Colors.white,
//           actions: [
//             IconButton(icon: Icon(Icons.add), onPressed: () {}),
//           ],
//           bottom: TabBar(
//               isScrollable: true, //导航栏及页面是否可以滚动
//               tabAlignment: TabAlignment.center,
//               labelColor: Colors.black,
//               labelStyle: const TextStyle(fontWeight: FontWeight.bold),
//               unselectedLabelColor: Colors.grey,
//               unselectedLabelStyle:
//                   const TextStyle(fontWeight: FontWeight.bold),
//               controller: _tabController,
//               indicatorColor: Colors.black,
//               indicatorWeight: 1,
//               indicatorSize: TabBarIndicatorSize.label,
//               tabs: tabs.map((e) {
//                 return Tab(
//                   text: e,
//                 );
//               }).toList()),
//         ),
//         body: Column(
//           children: [
//             Container(
//               height: 44,
              
//               padding: const EdgeInsets.only(left: 8,right: 8),
//               margin: const EdgeInsets.only(left: 8,right: 8),
             
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("平台/交易对数量"),
//                   Text("全球指数(￥)"),
//                   Text("ExRank"),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: const [
//                   PlatformType(),
//                   PlatformType(),
//                   PlatformType(),
//                   PlatformType(),
//                   PlatformType(),
//                   PlatformType(),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }
