import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/common/util/modal_util.dart';
import 'package:gachtaxi_app/domain/chat/data/service/chat_matching_service.dart';
import 'package:gachtaxi_app/domain/chat/presentation/view/taxi_call_screen.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/account_modal.dart';

class ChatActionBar extends ConsumerWidget {
  final MatchingCategory category;
  final int matchingRoomId;

  const ChatActionBar({super.key, required this.category, required this.matchingRoomId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMatchingService = ref.read(chatMatchingServiceProvider);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      width: double.infinity,
      height: 144.h,
      decoration: BoxDecoration(
        color: AppColors.charcoalGray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActionItem(
            icon: "assets/icons/taxi_on_icon.svg",
            label: "택시 호출",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TaxiCallScreen()),
              );
            },
          ),
          _buildActionItem(
            icon: "assets/icons/account_icon.svg",
            label: "계좌 전송",
            onTap: () {
              showCustomModal(
                context: context,
                child: AccountModal(accountNumber: "농협 302 XXXX XXXX XX"),
              );
            }
          ),
          _buildActionItem(
            icon: "assets/icons/matching_stop_icon.svg",
            label: "매칭 마감",
            onTap: () async {
              final bool success = await chatMatchingService.completeMatching(category, matchingRoomId);
              if (success) {
                // 모달? 토스트? 띄우기
              }
            }
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({required String icon, required String label, VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: AppColors.neutralDark, // 아직 미정
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 28.w,
                height: 28.w,
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
