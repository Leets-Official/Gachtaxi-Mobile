import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/manual_matching_create_screen.dart';
import 'package:gachtaxi_app/domain/home/components/default_padding.dart';
import 'package:gachtaxi_app/domain/home/providers/response/manual_matching_data_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/manual_matching_change_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/manual_category_view/manual_matching_category_screen.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/manual_category_view/my_matching_category_screen.dart';

class ManualMatchingScreen extends ConsumerWidget {
  const ManualMatchingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMatchingCategory =
        ref.watch(manualMatchingChangeNotifierProvider);
    final isManual = currentMatchingCategory == MatchingCategory.manual;
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.basicHeight * 1.5;

    return Stack(
      children: [
        DefaultPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    isManual
                        ? MatchingCategory.manual.label
                        : MatchingCategory.my.label,
                    style: TextStyle(
                      fontSize: AppTypography.fontSizeExtraLarge,
                      color: Colors.white,
                      fontWeight: AppTypography.fontWeightBold,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.spaceSmall),
                  TextButton(
                    onPressed: () async {
                      ref
                          .read(manualMatchingChangeNotifierProvider.notifier)
                          .toggleCategory();

                      if (isManual) {
                        await ref
                            .read(matchingDataNotifierProvider(
                                    MatchingCategory.my)
                                .notifier)
                            .refresh(MatchingCategory.my);
                      } else {
                        await ref
                            .read(matchingDataNotifierProvider(
                                    MatchingCategory.manual)
                                .notifier)
                            .refresh(MatchingCategory.manual);
                      }
                    },
                    child: Text(
                      isManual
                          ? MatchingCategory.my.label
                          : MatchingCategory.manual.label,
                      style: TextStyle(
                        color: AppColors.darkGray,
                        decorationColor: AppColors.darkGray,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.spaceCommon),
              IndexedStack(
                index: isManual ? 0 : 1,
                children: [
                  ManualMatchingCategoryScreen(true),
                  MyMatchingCategoryScreen(false),
                ],
              )
            ],
          ),
        ),
        if (isExpanded && isManual)
          Positioned(
            right: 20,
            bottom: 20,
            child: IconButton(
              iconSize: 32,
              style: IconButton.styleFrom(
                fixedSize: Size(48, 48),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.neutralAccent, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ManualMatchingCreateScreen(),
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
