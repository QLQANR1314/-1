import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool outline;
  final double verticalPadding;
  final Color primary;
  final bool loading;
  final Color? overlayColor;
  final BorderSide? side;

  const Btn({
    super.key,
    required this.child,
    this.onTap,
    this.outline = false,
    this.verticalPadding = 14,
    this.primary = const Color(0xFFFE2C54),
    this.loading = false,
    this.overlayColor,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: getStyle(),
      child: buildContent(),
    );
  }

  buildContent() {
    if (loading) {
      return SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          color: Colors.grey[300],
        ),
      );
    }
    return child;
  }

  ButtonStyle getStyle() {
    const grey = Color(0xFFF1F1F1);
    const textGrey = Color(0xFFAAAAAA);
    final disabled = onTap == null || loading;

    if (outline) {
      return TextButton.styleFrom(
        overlayColor: overlayColor,
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: side ??
              BorderSide(
                color: disabled ? textGrey : primary,
                width: 1,
              ),
        ),
        foregroundColor: disabled ? textGrey : primary,
      );
    }

    return TextButton.styleFrom(
      overlayColor: overlayColor,
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      backgroundColor: disabled ? grey : primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      foregroundColor: Colors.white,
    );
  }
}
