import 'package:biyan_finance/routes/home/chart/home_chart_details.dart';
import 'package:biyan_finance/widgets/navigation.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  const ChartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

         await Navigation.push(
                      context: context, child: const HomeChartDetails());

      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 236, 237),
              borderRadius: BorderRadius.circular(6)),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "BTC",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "assets/my/${"Right-arrow"}.png",
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
    // Container(
    //   // margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
    //   color: Colors.white,
    //   height: 90,
    //   child:

    // Row(
    //   children: [
    //     SizedBox(
    //       width: MediaQuery.of(context).size.width * 0.7,
    //       child: Column(
    //         children: [
    //           Container(
    //             padding: EdgeInsets.all(6),
    //             height: 60,
    //             child: const Column(
    //               children: [
    //                 Text(
    //                   '事实上事实上少时诵诗书飒飒飒算是方式发顺丰水电费健康束带结发水电费结发水电费结发水电费',
    //                   maxLines: 2,
    //                   style: TextStyle(
    //                     fontSize: 15,
    //                     color: Colors.black,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Expanded(
    //             child: Container(
    //               padding: const EdgeInsets.only(left: 8, right: 8),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Image.asset(
    //                         "assets/home/${"line-bitcoin"}.png",
    //                         width: 20,
    //                         height: 20,
    //                         fit: BoxFit.cover,
    //                       ),
    //                       const Text(
    //                         "ODAILY",
    //                         style: TextStyle(
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.w600
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   const Text(
    //                     "2小时前",
    //                     style: TextStyle(
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.w600
    //                         ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),

    //   ],
    // ),
    // );
  }
}
