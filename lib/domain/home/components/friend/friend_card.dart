import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/model/friend/friend_model.dart';

class FriendCard extends StatelessWidget {
  final Friend friend;
  final VoidCallback onAdditionalTap;
  const FriendCard({
    super.key,
    required this.friend,
    required this.onAdditionalTap,
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
            _buildProfileImage(friend.friendsProfileUrl),
            const SizedBox(width: AppSpacing.SpaceExtraExtraMedium),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  friend.friendsNickName,
                  style: TextStyle(
                    fontSize: AppTypography.fontSizeLarge,
                    fontWeight: AppTypography.fontWeightBold,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: onAdditionalTap,
                  child: SizedBox(
                    width: 32.w,
                    height: 32.h,
                    child: Center(
                      child: SvgPicture.asset(
                          'assets/icons/modal_next_on_icon.svg',
                          width: 9.w,
                          height: 16.h),
                    ),
                  ),
                ),
              ],
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
