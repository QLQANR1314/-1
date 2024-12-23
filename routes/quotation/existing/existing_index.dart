import 'package:biyan_finance/routes/quotation/existing/choice/existing_choice.dart';
import 'package:biyan_finance/routes/quotation/existing/classification/existing_classification.dart';
import 'package:biyan_finance/routes/quotation/existing/currency/existing_currency.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ExistingIndex extends StatefulWidget {
  const ExistingIndex({super.key});

  @override
  State<ExistingIndex> createState() => _ExistingIndexState();
}

class _ExistingIndexState extends State<ExistingIndex>
    with SingleTickerProviderStateMixin {
  List<String> tabs = ["自选", "币总", "分类"];
  late TabController _tabController;

  // 定义原始数据
  List<String> items = [
    "1",
  ];
  bool isLoad = true;
  // 定义刷新控制器
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
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
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
              isScrollable: true, //导航栏及页面是否可以滚动
              tabAlignment: TabAlignment.start,
              labelColor: Colors.black,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold),
              controller: _tabController,
              // indicatorColor: Colors.black,
              // indicatorWeight: 1,
              dividerHeight: 0,
              // indicatorSize: TabBarIndicatorSize.label,
              tabs: tabs.map((e) {
                return Tab(
                  text: e,
                );
              }).toList()),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ExistingChoice(), //自选
              ExistingCurrency(), //币总
              ExistingClassification(), //分类
            ],
          ),
        ),
      ],
    );
  }
}
