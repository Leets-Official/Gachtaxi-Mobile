import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/account_response.dart';
import 'package:gachtaxi_app/domain/chat/data/service/account_service.dart';
import 'package:gachtaxi_app/domain/chat/data/service/chat_matching_service.dart';
import 'package:gachtaxi_app/domain/chat/presentation/view/taxi_call_screen.dart';

class ChatActionBar extends ConsumerWidget {
  final MatchingCategory category;
  final int matchingRoomId;

  const ChatActionBar(
      {super.key, required this.category, required this.matchingRoomId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMatchingService = ref.read(chatMatchingServiceProvider);
    final accountService = ref.read(accountServiceProvider);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      width: double.infinity,
      height: 110.h,
      decoration: BoxDecoration(
        color: AppColors.charcoalGray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActionItem(
            icon: "assets/icons/taxi_on_icon.svg",
            label: "택시 호출",
            iconWidth: 35,
            iconHeight: 23,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TaxiCallScreen()),
              );
            },
          ),
          _buildActionItem(
              icon: "assets/icons/money_icon.svg",
              label: "계좌 전송",
              iconWidth: 30,
              iconHeight: 18,
              onTap: () async {
                final AccountResponse response =
                    await accountService.getAccount();
                final String? accountNumber = response.accountNumber;

                if (accountNumber != null && accountNumber.isNotEmpty) {
                  await Clipboard.setData(ClipboardData(text: accountNumber));

                  /*
                자체 토스트로 바꾸기
                 */
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("계좌번호가 복사되었습니다."),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("계좌번호를 불러올 수 없습니다."),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              }),
          _buildActionItem(
              icon: "assets/icons/matching_stop_icon.svg",
              label: "매칭 마감",
              iconWidth: 24,
              iconHeight: 24,
              onTap: () async {
                final bool success = await chatMatchingService.completeMatching(
                    category, matchingRoomId);
                if (success) {
                  // 모달? 토스트? 띄우기
                }
              }),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required String icon,
    required String label,
    required int iconWidth,
    required int iconHeight,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: AppColors.neutralDark, // 아직 미정
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: iconWidth.w,
                height: iconHeight.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              color: AppColors.lightGray,
              fontSize: AppTypography.fontSizeSmall.sp,
              fontWeight: AppTypography.fontWeightMedium,
            ),
          ),
        ],
      ),
    );
  }
}
