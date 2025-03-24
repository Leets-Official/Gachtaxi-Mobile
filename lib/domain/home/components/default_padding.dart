import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';

class DefaultPadding extends StatelessWidget {
  final Widget child;
  final double horizonPadding;
  const DefaultPadding(
      {super.key,
      required this.child,
      this.horizonPadding = AppSpacing.spaceCommon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizonPadding),
        child: child,
      ),
    );
  }
}
