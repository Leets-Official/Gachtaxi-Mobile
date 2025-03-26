import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/enums/friend_category.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/friend_changer_notifier.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';

class FriendListScreen extends ConsumerWidget {
  const FriendListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMatchingCategory = ref.watch(friendChangerNotifierProvider);
    final isFriend = currentMatchingCategory == FriendCategory.friend;
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.minHeight * 1.5;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSpacing.spaceCommon),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      isFriend ? '친구 목록' : '블랙리스트',
                      style: TextStyle(
                        fontSize: AppTypography.fontSizeExtraLarge,
                        color: Colors.white,
                        fontWeight: AppTypography.fontWeightBold,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spaceSmall),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(friendChangerNotifierProvider.notifier)
                            .toggleCategory();
                      },
                      child: Text(
                        isFriend ? '블랙리스트' : '친구 목록',
                        style: TextStyle(
                          color: AppColors.darkGray,
                          decorationColor: AppColors.darkGray,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.spaceLarge),
                // ManualMatchingCategoryScreen(isManual)
              ],
            ),
          ),
        ),
        if (isExpanded)
          Positioned(
            right: 20,
            bottom: 20,
            child: IconButton(
              iconSize: 32,
              style: IconButton.styleFrom(
                fixedSize: Size(48, 48),
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                // Navigator.of(context).push(
                //   SlidePageRoute(screen: ManualMatchingCreateScreen()),
                // );
              },
              icon: Icon(Icons.add),
            ),
          ),
      ],
    );
  }
}
