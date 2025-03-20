import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    '택시 앱으로 연결해 드릴게요',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    '원하는 택시 앱을 선택하면\n해당 앱으로 이동해요',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
                SizedBox(height: 166.h),

                Center(
                  child: Wrap(
                    spacing: 36.w,
                    runSpacing: 36.h,
                    alignment: WrapAlignment.center,
                    children: [
                      TaxiAppButton(
                        appName: '카카오 T',
                        iconPath: "assets/icons/kakaot.png",
                        appScheme: "kakaot://taxi?dest_lat=37.455201382476574&dest_lng=127.1339368474595",
                        appUri: "https://apps.apple.com/kr/app/%EC%B9%B4%EC%B9%B4%EC%98%A4-t/id981110422",
                        playUri: "https://play.google.com/store/apps/details?id=com.kakao.taxi",
                      ),
                      TaxiAppButton(
                        appName: '티머니 GO',
                        iconPath: "assets/icons/tmoney.png",
                        appScheme: "tmoneygo://",
                        appUri: "https://apps.apple.com/kr/app/%ED%8B%B0%EB%A8%B8%EB%8B%88go/id1526378171",
                        playUri: "https://play.google.com/store/apps/details?id=kr.co.tmoney.tia",
                      ),
                      TaxiAppButton(
                        appName: '우버',
                        iconPath: "assets/icons/uber.png",
                        appScheme: "uber://?action=setPickup"
                      "&pickup[latitude]=37.44852635280086&pickup[longitude]=127.12855122490176"
                      "&dropoff[latitude]=37.455201382476574&dropoff[longitude]=127.1339368474595",
                        appUri: "https://apps.apple.com/kr/app/uber/id368677368",
                        playUri: "https://play.google.com/store/apps/details?id=com.ubercab",
                      ),
                      TaxiAppButton(
                        appName: '타다',
                        iconPath: "assets/icons/tada.png",
                        appScheme: "tada://",
                        appUri: "https://apps.apple.com/kr/app/tada-seoul-taxi-ride-airport/id1422751774?l=en-GB",
                        playUri: "https://play.google.com/store/apps/details?id=kr.co.vcnc.tada",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
