import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class HomeChartDetails extends StatefulWidget {
  const HomeChartDetails({super.key});

  @override
  State<HomeChartDetails> createState() => _HomeChartDetailsState();
}

class _HomeChartDetailsState extends State<HomeChartDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "币详情",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "实时持仓",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              BrnProgressBarChart(
                barChartStyle: BarChartStyle.horizontal,
                xAxis: ChartAxis(axisItemList: [
                  AxisItem(showText: '20亿'),
                  AxisItem(showText: '40亿'),
                  AxisItem(showText: '60亿'),
                  AxisItem(showText: '80亿'),
                ]),
                yAxis: ChartAxis(axisItemList: [
                  AxisItem(showText: 'BTC'),
                  AxisItem(showText: 'TON'),
                  AxisItem(showText: 'NEAR'),
                  AxisItem(showText: 'SUI'),
                  AxisItem(showText: 'WIF'),
                  AxisItem(showText: 'DOGE'),
                  AxisItem(showText: 'XRP'),
                  AxisItem(showText: 'BNB'),
                  AxisItem(showText: 'BCH'),
             
                ]),
                singleBarWidth: 20,
                barGroupSpace:10,
                barBundleList: [
                  BrnProgressBarBundle(barList: [
                    BrnProgressBarItem(text: '示例1', value: 33),
                    BrnProgressBarItem(text: '示例2', value: 3),
                    BrnProgressBarItem(text: '示例3', value: 6),
                    BrnProgressBarItem(text: '示例4', value: 43),
                    BrnProgressBarItem(text: '示例5', value: 22),
                    BrnProgressBarItem(text: '示例6', value: 13),
                    BrnProgressBarItem(text: '示例7', value: 0.6),
                    BrnProgressBarItem(text: '示例8', value: 11),
                    BrnProgressBarItem(text: '示例9', value: 0.5),
                

                  ], colors: [
                    // Color(0xff1545FD),
                    // Color(0xff0984F9)
                    Colors.grey,
                    const Color.fromARGB(255, 222, 221, 221),


                  ]),
                ],
              ),

              const Row(
                children: [
                  Text(
                    "24H成交额",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              BrnProgressBarChart(
                barChartStyle: BarChartStyle.horizontal,
                xAxis: ChartAxis(axisItemList: [
                  AxisItem(showText: '20亿'),
                  AxisItem(showText: '40亿'),
                  AxisItem(showText: '60亿'),
                  AxisItem(showText: '80亿'),
                ]),
                yAxis: ChartAxis(axisItemList: [
                  AxisItem(showText: 'BTC'),
                  AxisItem(showText: 'TON'),
                  AxisItem(showText: 'NEAR'),
                  AxisItem(showText: 'SUI'),
                  AxisItem(showText: 'WIF'),
                  AxisItem(showText: 'DOGE'),
                  AxisItem(showText: 'XRP'),
                  AxisItem(showText: 'BNB'),
                  AxisItem(showText: 'BCH'),
             
                ]),
                singleBarWidth: 20,
                barGroupSpace:10,
                barBundleList: [
                  BrnProgressBarBundle(barList: [
                    BrnProgressBarItem(text: '示例1', value: 33),
                    BrnProgressBarItem(text: '示例2', value: 3),
                    BrnProgressBarItem(text: '示例3', value: 6),
                    BrnProgressBarItem(text: '示例4', value: 43),
                    BrnProgressBarItem(text: '示例5', value: 22),
                    BrnProgressBarItem(text: '示例6', value: 13),
                    BrnProgressBarItem(text: '示例7', value: 0.6),
                    BrnProgressBarItem(text: '示例8', value: 11),
                    BrnProgressBarItem(text: '示例9', value: 0.5),
                

                  ], colors: [
                    // Color(0xff1545FD),
                    // Color(0xff0984F9)
                    Colors.grey,
                    const Color.fromARGB(255, 222, 221, 221),


                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
