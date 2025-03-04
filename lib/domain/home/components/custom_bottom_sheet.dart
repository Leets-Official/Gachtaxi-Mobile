import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/domain/home/providers/sheet_height_provider.dart';

class CustomBottomSheet extends ConsumerStatefulWidget {
  final Widget child;
  const CustomBottomSheet({super.key, required this.child});

  @override
  ConsumerState<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends ConsumerState<CustomBottomSheet> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sheetHeightNotifierProvider.notifier).initialize(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final sheetHeightNotifier = ref.read(sheetHeightNotifierProvider.notifier);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
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
                double newHeight = sheetHeightState.containerHeight -
                    (details.primaryDelta! * 1.5);
                sheetHeightNotifier.updateHeight(newHeight);
              },
              onVerticalDragEnd: (details) {
                double velocity = details.primaryVelocity ?? 0;
                double threshold =
                    (sheetHeightState.minHeight + sheetHeightState.maxHeight) /
                        2;

                double newHeight = sheetHeightState.containerHeight;
                if (velocity.abs() > 500) {
                  newHeight = velocity < 0
                      ? sheetHeightState.maxHeight
                      : sheetHeightState.minHeight;
                } else {
                  newHeight = (sheetHeightState.containerHeight > threshold)
                      ? sheetHeightState.maxHeight
                      : sheetHeightState.minHeight;
                }

                sheetHeightNotifier.updateHeight(newHeight);
              },
              child: Column(
                children: [
                  Container(
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
                ],
              ),
            ),
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }
}
