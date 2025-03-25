import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';

class ModalUtils {
  static void showCommonBottomSheet({
    required BuildContext context,
    required Widget content,
    double heightFactor = 0.45,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: heightFactor,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF20271E),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppSpacing.spaceExtraLarge,
                left: AppSpacing.spaceExtraCommon,
                right: AppSpacing.spaceExtraCommon,
                bottom: AppSpacing.spaceExtraCommon,
              ),
              child: content,
            ),
          ),
        );
      },
    );
  }
}
