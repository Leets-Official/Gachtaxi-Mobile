import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/taxi_app_button.dart';

class TaxiCallScreen extends StatelessWidget {
  const TaxiCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141513),
      body: Center(
        child: DefaultLayout(
          hasAppBar: true,
          title: "택시앱 연결", //DefaultLayout에서 title이 보이게 수정 필요
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    '원하는 택시 앱으로 연결해드려요',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: AppTypography.fontSizeSmall.sp,
                      fontWeight: AppTypography.fontWeightMedium,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),

                Column(
                  children: [
                    TaxiAppButton(
                      appName: '카카오 T',
                      iconPath: "assets/icons/kakaot.svg",
                      appScheme: "kakaot://taxi?dest_lat=37.455201382476574&dest_lng=127.1339368474595",
                      appUri: "https://apps.apple.com/kr/app/%EC%B9%B4%EC%B9%B4%EC%98%A4-t/id981110422",
                      playUri: "https://play.google.com/store/apps/details?id=com.kakao.taxi",
                    ),
                    TaxiAppButton(
                      appName: '우버',
                      iconPath: "assets/icons/uber.svg",
                      appScheme: "uber://?action=setPickup"
                    "&pickup[latitude]=37.44852635280086&pickup[longitude]=127.12855122490176"
                    "&dropoff[latitude]=37.455201382476574&dropoff[longitude]=127.1339368474595",
                      appUri: "https://apps.apple.com/kr/app/uber/id368677368",
                      playUri: "https://play.google.com/store/apps/details?id=com.ubercab",
                    ),
                    TaxiAppButton(
                      appName: '타다',
                      iconPath: "assets/icons/tada.svg",
                      appScheme: "tada://",
                      appUri: "https://apps.apple.com/kr/app/tada-seoul-taxi-ride-airport/id1422751774?l=en-GB",
                      playUri: "https://play.google.com/store/apps/details?id=kr.co.vcnc.tada",
                    ),
                    buildSuggestionButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSuggestionButton() {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.charcoalGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.zero,
      ),
      onPressed: () {  },
      child: SizedBox(
        width: 328.w,
        height: 60.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: AppColors.singleGray,
                  shape: BoxShape.circle,
                ),
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.add,
                    color: Color(0xFFD9D9D9),
                  ),
                ),

              SizedBox(width: 14.w),

              Expanded(
                child: Text(
                  "다른 앱 건의하기",
                  style: TextStyle(
                    color: Color(0xFF989B9A),
                    fontSize: AppTypography.fontSizeSmall.sp,
                    fontWeight: AppTypography.fontWeightMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
