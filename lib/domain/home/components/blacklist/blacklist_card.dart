import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/model/blacklist/blacklist_model.dart';

class BlacklistCard extends StatelessWidget {
  final Blacklist blacklist;
  final VoidCallback onDeleteTap;
  const BlacklistCard({
    super.key,
    required this.blacklist,
    required this.onDeleteTap,
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
            SvgPicture.asset('assets/icons/profile_icon.svg',
                width: 48.w, height: 48.h),
            const SizedBox(width: AppSpacing.spaceMedium),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blacklist.receiverNickname,
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
                    blacklist.gender.value,
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
                  onTap: onDeleteTap,
                  child: SvgPicture.asset('assets/icons/delete_icon.svg',
                      width: 32.w, height: 32.h),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
