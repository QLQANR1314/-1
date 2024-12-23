import 'package:flutter/material.dart';

class PlatformItme extends StatelessWidget {
  const PlatformItme({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
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
                      "123个",
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
                  "428022.52亿",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "＄52313.91亿",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "9",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                  width: 50,
                  child: LinearProgressIndicator(
                    value: 0.5,
                    minHeight: 5,
                    borderRadius: BorderRadius.circular(2),
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
