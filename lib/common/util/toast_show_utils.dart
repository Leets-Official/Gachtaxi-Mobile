import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:toastification/toastification.dart';

class ToastShowUtils {
  final BuildContext context;

  const ToastShowUtils({required this.context});

  void showSuccess(String message) {
    toastification.show(
        context: context,
        title: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: AppTypography.fontSizeMedium,
            fontWeight: AppTypography.fontWeightMedium,
          ),
        ),
        type: ToastificationType.success,
        style: ToastificationStyle.flat,
        backgroundColor: AppColors.toastBackground,
        borderSide: BorderSide(
          color: AppColors.toastBackground,
        ),
        showIcon: false,
        autoCloseDuration: const Duration(seconds: 3),
        alignment: Alignment.bottomCenter,
        closeButton: ToastCloseButton(
          showType: CloseButtonShowType.onHover,
        ));
  }
}
