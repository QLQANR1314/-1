import 'package:biyan_finance/widgets/chart_item.dart';
import 'package:flutter/material.dart';

class HomeChartList extends StatefulWidget {
  const HomeChartList({super.key});

  @override
  State<HomeChartList> createState() => _HomeChartListState();
}

class _HomeChartListState extends State<HomeChartList> {
  List<String> items = [
    "1",
    "2",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "交易所",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // final info = items[index];
          return const ChartItem();
        },
        itemCount: items.length,
      ),
    );
  }
}
