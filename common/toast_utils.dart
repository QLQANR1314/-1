import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class ToastUtils {
  static const textStyle = TextStyle(fontSize: 14, color: Colors.white);

  static void showError(
    String text, {
    Alignment alignment = Alignment.center,
  }) {
    BotToast.showText(
      text: text,
      textStyle: textStyle,
      contentColor: const Color(0xFFF56C6C),
      align: alignment,
    );
  }

  static void showSuccess(
    String text, {
    Alignment alignment = Alignment.center,
  }) {
    BotToast.showText(
      text: text,
      textStyle: textStyle,
      align: alignment,
      contentPadding: const EdgeInsets.all(20),
    );
  }

  static void showInfo(
    String text, {
    Alignment alignment = Alignment.center,
  }) {
    BotToast.showText(
      text: text,
      contentColor: const Color(0xFFfca5a5),
      textStyle: textStyle,
      align: alignment,
    );
  }
}
