import 'dart:ffi';

import 'package:biyan_finance/routes/home/chart/home_chart_list.dart';
import 'package:biyan_finance/widgets/navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeChartIndex extends StatefulWidget {
  const HomeChartIndex({super.key});

  @override
  State<HomeChartIndex> createState() => _HomeChartIndexState();
}

class _HomeChartIndexState extends State<HomeChartIndex>
    with SingleTickerProviderStateMixin {
// 定义原始数据
  List<String> items = [
    "1",
  ];

  static const List<int> coinRatio = [
    20,
    40,
    50,
  ];

  static const List<int> coinRatiotype = [
    20,
    40,
    50,
    20,
    40,
    50,
    40,
    50,
  ];

  static const List<int> coinRatiotype1 = [
    20,
    40,
    50,
    20,
  ];
  bool isLoad = true;
  // 定义刷新控制器
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
  }

  void _onRefresh() async {
    // 模拟网络请求,此处延时1秒
    await Future.delayed(const Duration(milliseconds: 1000));

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
    await Future.delayed(const Duration(milliseconds: 1000));

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

  /// 获取子项目
  Widget getItem(int index) {
    return GestureDetector(
      onTap: () async {
        print("图表点击按钮");

         await Navigation.push(
                      context: context, child: const HomeChartList());
        

      },
      child: Container(
        margin: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: const Color.fromARGB(255, 236, 235, 235), width: 1), //边
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.book,
              size: 20,
              color: Colors.black,
            ),
            Text(
              "衍生品",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 4;

    final width1 = MediaQuery.of(context).size.width - 6;

    final width2 = MediaQuery.of(context).size.width - 2;
    return Scaffold(
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
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ListView.builder(
                    // 设置横向滚动
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        width: 100,
                        child: getItem(index),
                      );
                    },
                    itemCount: 20,
                  ),
                ),

                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "最近使用",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                Wrap(
                  spacing: 2,
                  // runSpacing: 10,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: coinRatiotype
                      .map((e) => Container(
                            padding: const EdgeInsets.all(4),
                            height: 80,
                            width: width1 / 4,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 236, 236, 237),
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.book,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "合约总持仓大萨达",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
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
                          "热门数据",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                Wrap(
                  spacing: 2,
                  // runSpacing: 10,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: coinRatiotype
                      .map((e) => Container(
                            padding: const EdgeInsets.all(4),
                            height: 80,
                            width: width1 / 4,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 236, 236, 237),
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.book,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "合约总持仓大萨达",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
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
                          "其他数据",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                Wrap(
                  spacing: 2,
                  // runSpacing: 10,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: coinRatiotype
                      .map((e) => Container(
                            padding: const EdgeInsets.all(4),
                            height: 80,
                            width: width1 / 4,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 236, 236, 237),
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.book,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "合约总持仓大萨达",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
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
                // const Padding(
                //     padding: EdgeInsets.only(top: 20, left: 8),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Text(
                //           "热门新闻",
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 18,
                //               fontWeight: FontWeight.w700),
                //         ),
                //       ],
                //     )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
