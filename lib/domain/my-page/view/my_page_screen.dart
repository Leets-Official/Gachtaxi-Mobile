import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/home/components/default_padding.dart';
import 'package:gachtaxi_app/domain/my-page/components/logout_or_withdraw_modal.dart';
import 'package:gachtaxi_app/domain/my-page/components/profile.dart';
import 'package:gachtaxi_app/domain/my-page/view/account_number_modify_screen.dart';
import 'package:gachtaxi_app/domain/my-page/view/notices_screen.dart';
import 'package:gachtaxi_app/domain/my-page/view/profile_modify_screen.dart';

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});

  @override
  ConsumerState<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends ConsumerState<MyPageScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'text': '공지 사항',
        'onTap': () => Navigator.push(
            context,
            SlidePageRoute(
              screen: NoticesScreen(),
            ))
      },
      {'text': '문의 사항', 'onTap': () => debugPrint('문의 사항 클릭')},
      {'text': '이용 약관', 'onTap': () => debugPrint('이용 약관 클릭')},
      {
        'text': '로그아웃 및 탈퇴',
        'onTap': () => showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return LogoutOrWithdrawModal();
            })
      },
    ];

    return SafeArea(
      child: DefaultPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: AppSpacing.spaceCommon,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '마이 페이지',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeExtraLarge,
                    fontWeight: AppTypography.fontWeightBold,
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    iconSize: 20,
                    foregroundColor: AppColors.primaryTag,
                  ),
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    Navigator.push(
                        context,
                        SlidePageRoute(
                          screen: ProfileModifyScreen(),
                        ));
                  },
                  icon: Icon(
                    Icons.create_rounded,
                  ),
                )
              ],
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
              height: 3,
              color: AppColors.darkGray.withValues(alpha: 0.3),
            ),
            const SizedBox(
              height: AppSpacing.spaceExtraLarge,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    screen: AccountNumberModifyScreen(),
                  ),
                );
              },
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Text(
                    "계좌번호",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppTypography.fontSizeLarge,
                      fontWeight: AppTypography.fontWeightMedium,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    '계좌번호 설정이 필요해요!',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: AppTypography.fontSizeMedium,
                    ),
                  )
                ],
              ),
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
