import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/components/default_padding.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/home/components/matching/auto/expanded_setting_card.dart';
import 'package:gachtaxi_app/domain/home/components/matching/auto/location_card.dart';
import 'package:gachtaxi_app/domain/home/providers/response/auto_matching_status_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';
import 'package:gachtaxi_app/domain/matching-waiting/view/matching_waiting_screen.dart';

class AutoMatchingScreen extends ConsumerWidget {
  const AutoMatchingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.basicHeight * 1.3;

    final matchingStatusState = ref.watch(autoMatchingStatusNotifierProvider);

    return DefaultPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '바로 매칭',
                style: TextStyle(
                  fontSize: AppTypography.fontSizeExtraLarge,
                  color: Colors.white,
                  fontWeight: AppTypography.fontWeightBold,
                ),
              ),
              SvgPicture.asset(
                'assets/icons/taxi_on_icon.svg',
                width: 40,
                height: 24,
              )
            ],
          ),
          SizedBox(
            height: isExpanded
                ? AppSpacing.spaceExtraLarge
                : AppSpacing.spaceCommon,
          ),
          LocationCard(),
          const SizedBox(height: AppSpacing.spaceCommon),
          if (isExpanded) ...[
            const ExpandedSettingCard(
              cardTitle: '친구 초대',
              cardListElement: [
                '봉식이',
                '길구봉구',
                '상놈',
                '현식이',
                '똘구봉구',
                '상상놈',
              ],
            ),
            const SizedBox(height: AppSpacing.spaceCommon),
            const ExpandedSettingCard(
              cardTitle: '키워드 선택',
              cardListElement: ['금연', '남자만', '여자만'],
              isTag: true,
            ),
            const SizedBox(height: AppSpacing.spaceLarge),
          ] else ...[
            Text(
              '추가 설정을 통해 상세한 매칭을 할 수 있어요',
              style: TextStyle(
                fontSize: AppTypography.fontSizeExtraSmall,
                color: AppColors.darkGray,
              ),
            ),
            const SizedBox(height: AppSpacing.spaceCommon),
          ],
          Button(
            enabled: matchingStatusState.maybeWhen(
              data: (res) => res.data != null ? !res.data!.isFound : true,
              orElse: () => false,
            ),
            isLoading: matchingStatusState.isLoading,
            buttonText: matchingStatusState.when(
              data: (res) {
                if (res.data != null && res.data!.isFound == true) {
                  return '자동 매칭 이용중';
                } else {
                  return '매칭 시작';
                }
              },
              loading: () => '확인 중...',
              error: (err, st) => '참여 불가',
            ),
            onPressed: () {
              matchingStatusState.when(
                data: (res) async {
                  if (res.data!.isFound == true) {
                    return;
                  } else {
                    await Navigator.push(
                      context,
                      SlidePageRoute(
                        screen: MatchingWaitingScreen(),
                      ),
                    );
                    await ref
                        // ignore: unused_result
                        .refresh(autoMatchingStatusNotifierProvider.future);
                  }
                },
                error: (err, st) {
                  debugPrint('에러 : $err');
                },
                loading: () {},
              );
            },
          )
        ],
      ),
    );
  }
}
