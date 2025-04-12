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
          color: Colors.white70,
          fontSize: AppTypography.fontSizeSmall,
          fontWeight: AppTypography.fontWeightBold,
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
    );
  }

  void showError(String message) {
    toastification.show(
      context: context,
      title: Text(message),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
    );
  }

  void showInfo(String message) {
    toastification.show(
      context: context,
      title: Text(message),
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
    );
  }
}
