import 'package:biyan_finance/routes/home/home_details/home_details_main.dart';
import 'package:biyan_finance/widgets/navigation.dart';
import 'package:flutter/material.dart';

class Mainitme extends StatelessWidget {
  const Mainitme({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        

        await Navigation.push(context: context, child: const HomeDetailsMain());
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
        padding: const EdgeInsets.only(left: 8, right: 8),
        height: 70,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 254, 254),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Container(
                //   height: 30,
                //   width: 30,
                //   color: Colors.yellow,
                // ),
                Image.asset(
                  "assets/home/${"ranking-1-copy"}.png",
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/home/${"line-bitcoin"}.png",
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),

                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BTC",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "222万亿",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "428022.52",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "＄52313.91",
                  style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "+0.89%",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
                ),
                Image.asset(
                  "assets/home/${"zoushitu"}.png",
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
