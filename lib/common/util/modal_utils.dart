import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/modal/custom_modal.dart';

class ModalUtils {
  static void showCommonBottomSheet({
    required BuildContext context,
    required Widget content,
    double heightFactor = 0.45,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // 배경 투명 유지
      isScrollControlled: true, // 높이 조정 가능하게 설정
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)), // 둥근 모서리 적용
      ),
      builder: (BuildContext context) {
        return CommonBottomSheet(
          child: content,
          heightFactor: heightFactor,
        );
      },
    );
  }
}
