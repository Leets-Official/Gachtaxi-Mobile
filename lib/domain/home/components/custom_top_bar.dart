import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/domain/home/providers/sheet_height_provider.dart';
import 'package:gachtaxi_app/domain/home/shared/notifier_icon.dart';

class CustomTopBar extends ConsumerWidget {
  const CustomTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSheetState = ref.watch(sheetHeightNotifierProvider);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      top: bottomSheetState.containerHeight == bottomSheetState.minHeight
          ? 20
          : -80,
      left: 20,
      right: 20,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.neutralDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/profile_icon.svg',
              width: 32,
              height: 32,
            ),
            SizedBox(width: 20),
            Text(
              '닉네임',
              style: TextStyle(color: Colors.white),
            ),
            Expanded(child: SizedBox()),
            NotifierIcon(),
          ],
        ),
      ),
    );
  }
}
