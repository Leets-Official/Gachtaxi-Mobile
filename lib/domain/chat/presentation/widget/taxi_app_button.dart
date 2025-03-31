import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TaxiAppButton extends StatelessWidget {
  final String appName;
  final String iconPath;
  final String appScheme;
  final String appUri;
  final String playUri;

  const TaxiAppButton({
    super.key,
    required this.appName,
    required this.iconPath,
    required this.appScheme,
    required this.appUri,
    required this.playUri,
  });

  Future<void> _launchApp() async {
    final Uri uri = Uri.parse(appScheme);
    final Uri storeUri = Uri.parse(Platform.isIOS ? appUri : playUri);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // 앱이 없으면 스토어로 이동
      await launchUrl(storeUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF20271E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.zero,
          ),
          onPressed: _launchApp,
          child: SizedBox(
            width: 112.w,
            height: 112.h,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  iconPath,
                  width: 56.w,
                  height: 56.h,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          appName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
