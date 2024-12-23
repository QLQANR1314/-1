import 'package:biyan_finance/widgets/navigation.dart';
import 'package:biyan_finance/widgets/webviewpage.dart';
import 'package:flutter/material.dart';

class FindJournalismItem extends StatelessWidget {
  const FindJournalismItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print("点击新闻");
        await Navigation.push(
                      context: context, child:  const Webviewpage(rule: "https://news.sina.com.cn/zx/gj/2024-09-30/doc-incqxmqv9692361.shtml",));
      },
      child:  Container(
      
      color: Colors.white,
      height: 90,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
          
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  height: 60,
                 
                  child: Column(
                    children: [
                      Text(
                        '事实上事实上少时诵诗书飒飒飒算是方式发顺丰水电费健康束带结发水电费结发水电费结发水电费',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/home/${"line-bitcoin"}.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              "ODAILY",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "2小时前",
                          style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Image.network(
                  "https://img0.baidu.com/it/u=2775931994,1446368906&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

        ],
      ),
    )
    );
    
   
  }
}