import 'package:flutter/material.dart';

// 공통 모달 호출 util
void showCustomModal({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  Color barrierColor = const Color(0x66000000), //black
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: isDismissible,
    barrierColor: barrierColor,
    builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (isDismissible) {
                Navigator.pop(context);
              }
            },
            behavior: HitTestBehavior.opaque,
            child: Container(color: Colors.transparent),
          ),

          Center(child: child),
        ],
      );
    },
  );
}
