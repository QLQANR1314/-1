
import 'package:biyan_finance/routes/quotation/quotation_type/platform_itme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PlatformType extends StatefulWidget {
  const PlatformType({super.key});

  @override
  State<PlatformType> createState() => _PlatformTypeState();
}

class _PlatformTypeState extends State<PlatformType> {
   // 定义原始数据
  List<String> items = [
    "1",


  ];
  bool isLoad = true;
  // 定义刷新控制器
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);


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
          child: ListView.builder(
            itemBuilder: (context, index) {
              // final info = items[index];
              return const PlatformItme();
            },
            itemCount: items.length,
          ),
        ),
      ),
    );
  }
}