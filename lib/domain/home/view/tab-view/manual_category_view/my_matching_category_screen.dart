import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/manual_matching_card.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/no_matching_viewer.dart';
import 'package:gachtaxi_app/domain/home/providers/response/manual_matching_data_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';

class MyMatchingCategoryScreen extends ConsumerWidget {
  final bool isManualMatching;

  const MyMatchingCategoryScreen(this.isManualMatching, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manualListData =
        ref.watch(manualMatchingDataNotifierProvider).data.rooms;
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.minHeight * 1.3;

    return SizedBox(
      width: double.infinity,
      height: isExpanded
          ? MediaQuery.of(context).size.height * 0.7
          : MediaQuery.of(context).size.height * 0.25,
      child: manualListData.isNotEmpty
          ? ListView.separated(
              padding: EdgeInsets.only(bottom: AppSpacing.spaceCommon * 2.5),
              itemBuilder: (context, index) {
                final room = manualListData[index];
                return ManualMatchingCard(
                  matchingRoom: room,
                  isManualMatching: isManualMatching,
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.spaceCommon),
              itemCount: manualListData.length,
            )
          : NoMatchingViewer(),
    );
  }
}
