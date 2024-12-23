import 'package:biyan_finance/apis/homeapi.dart';
import 'package:biyan_finance/models/product_model/home_tweets_model.dart';
import 'package:biyan_finance/routes/home_push/push/push_itme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PushIndex extends StatefulWidget {
  const PushIndex({super.key});

  @override
  State<PushIndex> createState() => _PushIndexState();
}

class _PushIndexState extends State<PushIndex>
    with SingleTickerProviderStateMixin {
  bool isLoad = true;
  // 定义刷新控制器
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<tweetsDataModel> _products = [];

  void _getData() {
    Homeapi.list().then((value) {
      print("_products====${value[0].recordId}");
      setState(() {
        _products = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _getData();
  }

  void _onRefresh() async {
    Homeapi.list().then((value) {
      print("_products====${value[0].recordId}");
      if (mounted) {
        setState(() {
          _products = value;
        });
      }
    });

    // 重置获取数据LoadStatus
    _refreshController.refreshCompleted(resetFooterState: true);
  }

  void _onLoading() async {
    Homeapi.list().then((value) {
      print("_products====${value[0].recordId}");
      if (mounted) {
        setState(() {
          _products = value;
        });
      }
    });

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
              final info = _products[index];

              print("info======${info.images![0].url}");
              return  PushItme(info: info,);
            },
            itemCount: _products.length,
          ),
        ),
      ),
    );
  }
}
