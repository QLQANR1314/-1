import 'package:flutter/cupertino.dart';

class Navigation {
  static Future<T?> push<T>({
    required BuildContext context,
    required Widget child,
    bool fullscreenDialog = false,
  }) {
    return Navigator.of(context).push<T>(
      CupertinoPageRoute(
        builder: (_) => child,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  static popUntil(
    BuildContext context, {
    int count = 1,
  }) {
    int v = 0;
    Navigator.of(context).popUntil((_) => v++ >= count);
  }

  static pushReplacement({
    required BuildContext context,
    required Widget child,
  }) {
    return Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => child),
    );
  }
}
