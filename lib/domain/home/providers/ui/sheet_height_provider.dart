import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sheet_height_provider.g.dart';

@riverpod
class SheetHeightNotifier extends _$SheetHeightNotifier {
  @override
  BottomSheetHeightState build() {
    final height = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;

    return BottomSheetHeightState(
      maxHeight: height * (4 / 5),
    );
  }

  void updateHeight(double newHeight) {
    if (newHeight >= state.minHeight && newHeight <= state.maxHeight) {
      state = state.copyWith(containerHeight: newHeight);
    }
  }
}

class BottomSheetHeightState {
  final double containerHeight;
  final double minHeight;
  final double maxHeight;

  BottomSheetHeightState({
    this.containerHeight = 330,
    this.minHeight = 330,
    required this.maxHeight,
  });

  BottomSheetHeightState copyWith({
    double? containerHeight,
    double? minHeight,
    double? maxHeight,
  }) {
    return BottomSheetHeightState(
      containerHeight: containerHeight ?? this.containerHeight,
      minHeight: minHeight ?? this.minHeight,
      maxHeight: maxHeight ?? this.maxHeight,
    );
  }
}
