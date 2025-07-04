import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/providers/response/manual_matching_data_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/matching_setting_provider.dart';

class ExpandedSettingCard extends StatelessWidget {
  final String cardTitle;
  final bool isTag;
  final List<String> cardListElement;
  const ExpandedSettingCard(
      {super.key,
      required this.cardTitle,
      required this.cardListElement,
      this.isTag = false});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              cardTitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: AppTypography.fontWeightRegular,
                fontSize: AppTypography.fontSizeMedium,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: cardListElement.length,
                itemBuilder: (context, index) {
                  return ListElement(
                    elementTitle: cardListElement[index],
                    isTag: isTag,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 태그 요소 UI
class ListElement extends ConsumerWidget {
  final String elementTitle;
  final bool isTag;
  const ListElement(
      {super.key, required this.elementTitle, required this.isTag});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchingSettingState = ref.watch(matchingSettingNotifierProvider);
    final matchingSettingNotifier = ref.read(matchingSettingNotifierProvider.notifier);

    return GestureDetector(
      onTap: () {
        if (isTag) {
          matchingSettingNotifier.toggleTag(elementTitle);
        } else {
          matchingSettingNotifier.toggleFriend(elementTitle);
        }
      },
      child: Container(
        height: 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(999)),
          color: isTag
              ? matchingSettingState.selectedTags.contains(elementTitle)
                  ? AppColors.primary
                  : AppColors.neutralDark
              : matchingSettingState.selectedFriends.contains(elementTitle)
                  ? AppColors.primary
                  : AppColors.neutralDark),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSpacing.spaceCommon),
          child: Center(
              child: Text(
            '${isTag ? '#' : ''} $elementTitle',
            style: TextStyle(
              color: isTag
                  ? matchingSettingState.selectedTags.contains(elementTitle)
                      ? AppColors.neutralDark
                      : Colors.grey
                  : matchingSettingState.selectedFriends.contains(elementTitle)
                      ? AppColors.neutralDark
                      : Colors.grey,
              fontWeight: AppTypography.fontWeightMedium,
              fontSize: AppTypography.fontSizeSmall,
            ),
          )),
        ),
      ),
    );
  }
}
