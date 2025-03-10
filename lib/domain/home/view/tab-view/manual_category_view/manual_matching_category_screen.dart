import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/manual_matching_card.dart';
import 'package:gachtaxi_app/domain/home/providers/response/manual_matching_data_provider.dart';

class ManualMatchingCategoryScreen extends ConsumerWidget {
  final bool isManualMatching; // 이 값을 통해 두 화면을 구분
  const ManualMatchingCategoryScreen(this.isManualMatching, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manualListData = ref.watch(manualMatchingDataNotifierProvider);

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.separated(
          padding: EdgeInsets.only(bottom: AppSpacing.spaceCommon * 2.5),
          itemBuilder: (context, index) {
            final room = manualListData.data.rooms[index];
            return ManualMatchingCard(
              matchingRoom: room,
              isManualMatching: isManualMatching,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: AppSpacing.spaceCommon,
            );
          },
          itemCount: manualListData.data.rooms.length),
    );
  }
}
