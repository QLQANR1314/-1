import 'package:biyan_finance/MyBar.dart';
import 'package:biyan_finance/providers/tabar_provider.dart';
import 'package:biyan_finance/routes/find/newsflash/find_newsflash_item.dart';
import 'package:biyan_finance/routes/home/market/Popular/home_popular.dart';
import 'package:biyan_finance/widgets/btn.dart';
import 'package:biyan_finance/widgets/navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeMarketIndex extends StatefulWidget {
  const HomeMarketIndex({super.key});

  @override
  State<HomeMarketIndex> createState() => _HomeMarketIndexState();
}

class _HomeMarketIndexState extends State<HomeMarketIndex>
    with SingleTickerProviderStateMixin {
  // 定义原始数据
  List<String> items = [
    "1",
    "1",
    "1",
    "1",
  ];

  static const List<int> coinRatio = [
    20,
    40,
    50,
  ];

  static const List<Map<dynamic, String>> coinRatiotype = [
    {"icon": "home_circulation.png", "title": "资金净流入流出"},
    {"icon": "home_order1.png", "title": "聚合订单本差值"},
    {"icon": "home_screen.png", "title": "视觉筛选器"},
    {"icon": "home_Bag.png", "title": "ETF"},
    {"icon": "home_zhanbitu.png", "title": "清算地图"},
    {"icon": "home_zoushitu.png", "title": "清算热图"},
    {"icon": "home_Heatmap.png", "title": "资金费率热图"},
    {"icon": "home_more.png", "title": "更多"},
  ];

  static const List<int> coinRatiotype1 = [
    0,
    1,
    2,
    3,
  ];
  bool isLoad = true;
  // 定义刷新控制器
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
  }

  void _onRefresh() async {
    // 模拟网络请求,此处延时1秒
    await Future.delayed(Duration(milliseconds: 1000));

    // 刷新成功，数据恢复原样
    items = [
      "1",
    ];
    if (mounted) {
      setState(() {});
    }
    // 重置获取数据LoadStatus
    _refreshController.refreshCompleted(resetFooterState: true);
  }

  void _onLoading() async {
    // 模拟网络请求,此处延时1秒
    await Future.delayed(Duration(milliseconds: 1000));

    //每次加载两个数据
    // items.add("22222");

    // 每次模拟加载数据，等到数据加载到20个为止，模拟数据都获取完成, 并设置LoadStatus
    if (items.length >= 2) {
      _refreshController.loadNoData();
      return;
    }

    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 4;

    final width1 = MediaQuery.of(context).size.width - 6;

    final width2 = MediaQuery.of(context).size.width - 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshConfiguration(
        footerTriggerDistance: 80,
        //   dragSpeedRatio: 0.91,
        hideFooterWhenNotFull: true,
        headerBuilder: () => ClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        child: SmartRefresher(
          dragStartBehavior: DragStartBehavior.down,
          enablePullDown: true, // 下拉刷新
          enablePullUp: true, // 上拉加载数据
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  spacing: 2,
                  // runSpacing: 10,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: coinRatio
                      .map((e) => Container(
                            padding: const EdgeInsets.all(4),
                            height: 90,
                            width: width / 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 236, 236, 237),
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "合约总持仓",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text("560亿",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700)),
                                  Text("21.56%",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
                Wrap(
                  spacing: 2,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: coinRatiotype
                      .map((e) => Container(
                            padding: const EdgeInsets.all(4),
                            height: 80,
                            width: width1 / 4,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  // color:
                                  //     const Color.fromARGB(255, 236, 236, 237),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/home/${e["icon"]}",
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "${e["title"]}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "热门行情",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                Wrap(
                  spacing: 2,
                  // runSpacing: 10,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: coinRatiotype1
                      .map((e) => Container(
                          padding: const EdgeInsets.all(4),
                          height: 120,
                          width: width2 / 2,
                          child: GestureDetector(
                            onTap: () async {

                              print("持仓变化${e}");
                              if (e == 0) {
                                print("持仓变化");

                                await Navigation.push(
                                    context: context,
                                    child: const HomePopular(type: 0));
                              } else if (e == 1) {
                                print("价格变化");
                                await Navigation.push(
                                    context: context,
                                    child: const HomePopular(type: 1));
                              } else if (e == 2) {
                              } else {}
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 236, 235, 235),
                                    width: 1), //边
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          children: [
                                            Text(
                                              "持仓变化(24H)",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 149, 147, 147),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          "assets/my/${"Right-arrow"}.png",
                                          width: 12,
                                          height: 12,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/home/${"line-bitcoin"}.png",
                                              width: 20,
                                              height: 20,
                                              fit: BoxFit.cover,
                                            ),
                                            const Text(
                                              "BTC",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 149, 147, 147),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "-0.22%",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/home/${"line-bitcoin"}.png",
                                              width: 20,
                                              height: 20,
                                              fit: BoxFit.cover,
                                            ),
                                            const Text(
                                              "BTC",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 149, 147, 147),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "-0.22%",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/home/${"line-bitcoin"}.png",
                                              width: 20,
                                              height: 20,
                                              fit: BoxFit.cover,
                                            ),
                                            const Text(
                                              "BTC",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 149, 147, 147),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "-0.22%",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )))
                      .toList(),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "热门新闻",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // final info = items[index];
                    return const FindNewsflashItem();
                  },
                  itemCount: items.length,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
                  child: SizedBox(
                    width: double.infinity,
                    child: Btn(
                      onTap: () async {},
                      primary: Colors.black,
                      child: const Text("查看更多"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
