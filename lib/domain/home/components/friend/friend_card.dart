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
      height: 101.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.neutralComponent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.spaceCommon,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileImage(friend.friendsProfileUrl),
            const SizedBox(width: AppSpacing.spaceMedium),
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppSpacing.spaceExtraSmall),
                  child: Text(
                    friend.gender.value,
                    style: TextStyle(
                      fontSize: AppTypography.fontSizeSmall,
                      color: AppColors.darkGray,
                    ),
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
                  child: SvgPicture.asset('assets/icons/additional_icon.svg',
                      width: 24.w, height: 24.h),
                ),
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 16.sp,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
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
    return profilePicture != null
        ? CircleAvatar(
            backgroundImage: NetworkImage(
              profilePicture,
            ),
            radius: 24.r,
          )
        : SvgPicture.asset('assets/icons/profile_icon.svg',
            width: 48.w, height: 48.h);
  }
}
