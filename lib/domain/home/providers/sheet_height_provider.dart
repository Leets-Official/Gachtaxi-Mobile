import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sheet_height_provider.g.dart';

@riverpod
class SheetHeightNotifier extends _$SheetHeightNotifier {
  @override
  BottomSheetHeightState build() {
    return BottomSheetHeightState(
      containerHeight: 0,
      minHeight: 0,
      maxHeight: 0,
    );
  }

  void initialize(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    state = BottomSheetHeightState(
      containerHeight: height / 2.5,
      minHeight: height / 2.5,
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
    required this.containerHeight,
    required this.minHeight,
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
