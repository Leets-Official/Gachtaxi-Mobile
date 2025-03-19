import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';

class CommonBottomSheet extends StatelessWidget {
  final Widget child;
  final double heightFactor;

  const CommonBottomSheet({
    Key? key,
    required this.child,
    this.heightFactor = 0.4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: heightFactor,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF20271E),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.spaceExtraLarge,
            left: AppSpacing.spaceExtraCommon,
            right: AppSpacing.spaceExtraCommon,
            bottom: AppSpacing.spaceExtraCommon,
          ),
          child: child,
        ),
      ),
    );
  }
}
