import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';

class CustomBottomSheet extends ConsumerStatefulWidget {
  final Widget child;
  const CustomBottomSheet({super.key, required this.child});

  @override
  ConsumerState<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends ConsumerState<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final sheetHeightNotifier = ref.read(sheetHeightNotifierProvider.notifier);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: double.infinity,
      curve: Curves.easeOut,
      height: sheetHeightState.containerHeight,
      decoration: BoxDecoration(
        color: AppColors.neutralDark,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              final delta = details.primaryDelta ?? 0;
              final newHeight =
                  sheetHeightState.containerHeight - (delta * 1.2);
              sheetHeightNotifier.updateHeight(newHeight);
            },
            onVerticalDragEnd: (details) {
              final velocity = details.primaryVelocity ?? 0;
              double newHeight = sheetHeightState.containerHeight;

              if (velocity.abs() > 50) {
                if (velocity < 0) {
                  newHeight = (sheetHeightState.containerHeight >=
                          sheetHeightState.basicHeight)
                      ? sheetHeightState.maxHeight
                      : sheetHeightState.basicHeight;
                } else {
                  newHeight = (sheetHeightState.containerHeight <=
                          sheetHeightState.basicHeight)
                      ? sheetHeightState.minHeight
                      : sheetHeightState.basicHeight;
                }
              } else {
                if (sheetHeightState.containerHeight >
                    sheetHeightState.basicHeight * 1.1) {
                  newHeight = sheetHeightState.maxHeight;
                } else if (sheetHeightState.containerHeight <
                    sheetHeightState.basicHeight * 0.9) {
                  newHeight = sheetHeightState.minHeight;
                } else if (sheetHeightState.containerHeight >
                    sheetHeightState.basicHeight * 0.5) {
                  newHeight = sheetHeightState.basicHeight;
                }
              }

              sheetHeightNotifier.updateHeight(newHeight);
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
