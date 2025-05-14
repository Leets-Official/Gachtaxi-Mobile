import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';

class NoMatchingViewer extends ConsumerWidget {
  const NoMatchingViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.basicHeight * 1.3;

    return SizedBox(
      height: isExpanded ? MediaQuery.of(context).size.height * 0.68 : 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/no_list_icon.svg',
            width: 90,
            height: 90,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            '매칭 내역이 없어요',
            style: TextStyle(
              color: AppColors.darkGray,
              fontSize: AppTypography.fontSizeMedium,
              fontWeight: AppTypography.fontWeightMedium,
            ),
          )
        ],
      ),
    );
  }
}
