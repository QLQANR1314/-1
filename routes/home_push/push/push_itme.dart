import 'package:biyan_finance/models/product_model/home_tweets_model.dart';
import 'package:flutter/material.dart';

class PushItme extends StatelessWidget {
  final tweetsDataModel info;

  const PushItme({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          print("点击新闻");
        },
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: BorderTimeLine(1),
            ),
            child: Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(right: 10, left: 20),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  
                    Text(info.tweet_time.toString(),
                        style: const TextStyle(color: Colors.black, fontSize: 16)),
                    const Text("标题",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    Text(info.tweet_text.toString()),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  ]),
            )));
  }
}

class BorderTimeLine extends BorderDirectional {
  int position;

  BorderTimeLine(this.position);

  double radius = 4;
  double margin = 20;
  final Paint _paint = Paint()
    ..color = const Color(0xFFDDDDDD)
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Rect rect,
      {TextDirection? textDirection,
      BoxShape shape = BoxShape.rectangle,
      BorderRadius? borderRadius}) {
    if (position != 0) {
      canvas.drawLine(Offset(rect.left + margin + radius / 2, rect.top),
          Offset(rect.left + margin + radius / 2, rect.bottom), _strokePaint());
      canvas.drawCircle(
          Offset(rect.left + margin + radius / 2, rect.top + radius * 2),
          radius,
          _fillPaint());
      canvas.drawCircle(
          Offset(rect.left + margin + radius / 2, rect.top + radius * 2),
          radius,
          _strokePaint());
    } else {
      canvas.drawLine(
          Offset(rect.left + margin + radius / 2, rect.top + radius * 2),
          Offset(rect.left + margin + radius / 2, rect.bottom),
          _strokePaint());
      canvas.drawCircle(
          Offset(rect.left + margin + radius / 2, rect.top + radius * 2),
          radius,
          _fillPaint());
      canvas.drawCircle(
          Offset(rect.left + margin + radius / 2, rect.top + radius * 2),
          radius,
          _strokePaint());
      canvas.drawCircle(
          Offset(rect.left + margin + radius / 2, rect.top + radius * 2),
          radius / 2,
          _strokePaint());
    }
  }

  Paint _fillPaint() {
    _paint.color = Color(0xFFDDDDDD);
    _paint.style = PaintingStyle.fill;
    return _paint;
  }

  Paint _strokePaint() {
    _paint.color = Color(0xFFDDDDDD);
    _paint.style = PaintingStyle.stroke;
    return _paint;
  }
}
