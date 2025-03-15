import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';

class CustomModal extends StatelessWidget {
  final Widget child;
  final VoidCallback onClose;

  const CustomModal({
    Key? key,
    required this.child,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

      ],
    );
  }
}
