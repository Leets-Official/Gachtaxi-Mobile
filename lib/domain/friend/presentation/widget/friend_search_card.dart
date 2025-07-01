import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/friend/data/models/member_summary.dart';

class FriendSearchCard extends StatelessWidget {
  final MemberSummary friend;
  final Function() onAddButtonTap;
  const FriendSearchCard({
    super.key,
    required this.friend,
    required this.onAddButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.singleGray.withValues(alpha: 0.5),
            width: 1.w,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceCommon,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileImage(friend.profilePicture),
            const SizedBox(width: AppSpacing.SpaceExtraExtraMedium),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  friend.nickname,
                  style: TextStyle(
                    fontSize: AppTypography.fontSizeLarge,
                    fontWeight: AppTypography.fontWeightBold,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 70.w,
              height: 34.h,
              child: Button(
                buttonText: '요청',
                onPressed: onAddButtonTap,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(String? profilePicture) {
    final bool hasProfilePicture =
        profilePicture != null && profilePicture.isNotEmpty;
    return hasProfilePicture
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              profilePicture,
              width: 36.w,
              height: 36.h,
              fit: BoxFit.cover,
            ),
          )
        : SizedBox(
            width: 36.w,
            height: 36.h,
            child: SvgPicture.asset('assets/icons/profile_on_icon.svg'),
          );
  }
}
