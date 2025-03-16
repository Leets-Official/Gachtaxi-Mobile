import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/layout/default_padding.dart';
import 'package:gachtaxi_app/domain/my-page/components/profile.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'text': '공지 사항', 'onTap': () => print('공지 사항 클릭')},
      {'text': '문의 사항', 'onTap': () => print('문의 사항 클릭')},
      {'text': '계좌번호 설정', 'onTap': () => print('계좌번호 설정')},
      {'text': '로그아웃 및 탈퇴', 'onTap': () => print('로그아웃 및 탈퇴')},
    ];

    return DefaultLayout(
      hasAppBar: true,
      child: DefaultPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: AppSpacing.spaceCommon,
            ),
            const Text(
              '마이 페이지',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppTypography.fontSizeExtraLarge,
                fontWeight: AppTypography.fontWeightBold,
              ),
            ),
            const SizedBox(
              height: AppSpacing.spaceExtraLarge,
            ),
            // 프로필 확인 및 변경 섹션
            Pofile(),
            const SizedBox(
              height: AppSpacing.spaceExtraLarge,
            ),
            Divider(
              thickness: 3,
              height: 5,
              color: AppColors.darkGray.withValues(alpha: 0.3),
            ),
            const SizedBox(
              height: AppSpacing.spaceExtraLarge,
            ),
            Column(
              children: menuItems.map((menuItem) {
                return Column(
                  children: [
                    _buildLink(
                      linkText: menuItem['text'],
                      onTap: menuItem['onTap'],
                    ),
                    const SizedBox(height: AppSpacing.spaceExtraLarge),
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _buildLink({
    required String linkText,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Text(
            linkText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppTypography.fontSizeLarge,
              fontWeight: AppTypography.fontWeightMedium,
            ),
          ),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
