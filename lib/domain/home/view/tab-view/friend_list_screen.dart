import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/enums/friend_category.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/home/components/friend/friend_request_screen.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/friend_changer_notifier.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/friend_category_view/blacklist_category_screen.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/friend_category_view/friend_category_screen.dart';

class FriendListScreen extends ConsumerWidget {
  const FriendListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFriendCategory = ref.watch(friendChangerNotifierProvider);
    final isFriend = currentFriendCategory == FriendCategory.friend;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isFriend ? '친구 목록' : '블랙리스트',
                      style: TextStyle(
                        fontSize: AppTypography.fontSizeExtraLarge,
                        color: Colors.white,
                        fontWeight: AppTypography.fontWeightBold,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spaceMedium),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        ref
                            .read(friendChangerNotifierProvider.notifier)
                            .toggleCategory();
                      },
                      child: Text(
                        isFriend ? '블랙리스트' : '친구 목록',
                        style: TextStyle(
                          color: AppColors.darkGray,
                          fontSize: AppTypography.fontSizeMedium,
                          decorationColor: AppColors.darkGray,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.spaceLarge),
                if (isFriend)
                  FriendCategoryScreen(isFriend: isFriend)
                else
                  BlacklistCategoryScreen(isBlacklist: !isFriend)
              ],
            ),
          ),
        ),
        if (isExpanded && isFriend)
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FriendRequestScreen(),
                  ),
                );
              },
              icon: Icon(Icons.add),
            ),
          ),
      ],
    );
  }
}
