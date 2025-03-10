import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/manual_matching_change_provider.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/manual_category_view/manual_matching_category_screen.dart';

class ManualMatchingScreen extends ConsumerWidget {
  const ManualMatchingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMatchingCategory =
        ref.watch(manualMatchingChangeNotifierProvider);
    final isManual = currentMatchingCategory == 'manual_matching';

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceCommon),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          children: [
            Text(
              isManual ? '수동 매칭' : '나의 매칭',
              style: TextStyle(
                fontSize: AppTypography.fontSizeExtraLarge,
                color: Colors.white,
                fontWeight: AppTypography.fontWeightBold,
              ),
            ),
            const SizedBox(
              width: AppSpacing.spaceSmall,
            ),
            TextButton(
                onPressed: () {
                  ref
                      .read(manualMatchingChangeNotifierProvider.notifier)
                      .toggleCategory();
                },
                child: Text(
                  isManual ? '나의 매칭' : '수동 매칭',
                  style: TextStyle(
                      color: AppColors.darkGray,
                      decorationColor: AppColors.darkGray,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
        const SizedBox(
          height: AppSpacing.spaceLarge,
        ),
        isManual
            ? ManualMatchingCategoryScreen(isManual)
            : ManualMatchingCategoryScreen(isManual)
      ]),
    ));
  }
}
