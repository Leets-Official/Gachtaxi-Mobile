import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/my-page/view/notice_screen.dart';

class NoticeCard extends StatelessWidget {
  final int noticeId;
  final String title;
  final String createDate;

  const NoticeCard({
    super.key,
    required this.noticeId,
    required this.title,
    required this.createDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          SlidePageRoute(
            screen: NoticeScreen(noticeId: noticeId),
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceMedium,
          vertical: AppSpacing.spaceLarge,
        ),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: AppColors.darkGray,
          width: 0.5,
        ))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '[공지] $title',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeLarge,
                    fontWeight: AppTypography.fontWeightRegular,
                  ),
                ),
                const SizedBox(
                  height: AppSpacing.spaceExtraSmall,
                ),
                Text(
                  createDate,
                  style: const TextStyle(
                    color: AppColors.darkGray,
                    fontSize: AppTypography.fontSizeMedium,
                    fontWeight: AppTypography.fontWeightRegular,
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
