import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
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
            backgroundColor: AppColors.charcoalGray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.zero,
          ),
          onPressed: _launchApp,
          child: SizedBox(
            width: 328.w,
            height: 78.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SvgPicture.asset(
                      iconPath,
                      width: 48.w,
                      height: 48.h,
                    ),
                  ),

                  SizedBox(width: 14.w),

                  Expanded(
                    child: Text(
                      appName,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppTypography.fontSizeLarge.sp,
                        fontWeight: AppTypography.fontWeightBold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryTag,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
