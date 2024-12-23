import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class HomeDetailsTransactionData extends StatefulWidget {
  const HomeDetailsTransactionData({super.key});

  @override
  State<HomeDetailsTransactionData> createState() =>
      _HomeDetailsTransactionDataState();
}

class _HomeDetailsTransactionDataState
    extends State<HomeDetailsTransactionData> {
  List<String> tagList = ['15分', '30分', '1小时', '2小时', '4小时', "1天"];

  List<BrnDoughnutDataItem> dataList = [
    BrnDoughnutDataItem(value: 40, title: "20%", color: Colors.red),
    BrnDoughnutDataItem(value: 25, title: "12%", color: Colors.green),
    BrnDoughnutDataItem(value: 20, title: "13%", color: Colors.orange),
    BrnDoughnutDataItem(value: 10, title: "14%", color: Colors.blue),
    BrnDoughnutDataItem(value: 5, title: "5%", color: Colors.yellow),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 254, 254),
            borderRadius: BorderRadius.circular(6)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "资金流向分析",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      BrnDoughnutChart(
                        padding: EdgeInsets.all(50),
                        width: 200,
                        height: 200,
                        data: dataList,
                        
                        showTitleWhenSelected: false,
                        // selectCallback: (BrnDoughnutDataItem? selectedItem) {
                        //   setState(() {
                        //     dataList[0] = selectedItem!;
                        //   });
                        // },
                      ),
                      DoughnutChartLegend(
                          data: dataList,
                          legendStyle: BrnDoughnutChartLegendStyle.wrap),
                      
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
