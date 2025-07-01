import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/components/button.dart';
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
            SizedBox(
              width: 36.w,
              height: 36.h,
              child: SvgPicture.asset('assets/icons/profile_icon.svg'),
            ),
            const SizedBox(width: AppSpacing.SpaceExtraExtraMedium),
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
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 70.w,
              height: 34.h,
              child: Button(
                buttonText: '해제',
                onPressed: onDeleteTap,
              ),
            )
          ],
        ),
      ),
    );
  }
}
