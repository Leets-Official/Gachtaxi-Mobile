import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/manual_matching_card.dart';
import 'package:gachtaxi_app/domain/home/providers/response/manual_matching_data_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';

class ManualMatchingCategoryScreen extends ConsumerStatefulWidget {
  final bool isManualMatching;

  const ManualMatchingCategoryScreen(this.isManualMatching, {super.key});

  @override
  _ManualMatchingCategoryScreenState createState() =>
      _ManualMatchingCategoryScreenState();
}

class _ManualMatchingCategoryScreenState
    extends ConsumerState<ManualMatchingCategoryScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(covariant ManualMatchingCategoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 카테고리 변경 시 스크롤을 최상위로 올리도록 변경
    if (oldWidget.isManualMatching != widget.isManualMatching) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final manualListData = ref.watch(manualMatchingDataNotifierProvider);
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.minHeight * 1.3;

    return SizedBox(
      width: double.infinity,
      height: isExpanded
          ? MediaQuery.of(context).size.height * 0.7
          : MediaQuery.of(context).size.height * 0.25,
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.only(bottom: AppSpacing.spaceCommon * 2.5),
        itemBuilder: (context, index) {
          final room = manualListData.data.rooms[index];
          return ManualMatchingCard(
            matchingRoom: room,
            isManualMatching: widget.isManualMatching,
          );
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSpacing.spaceCommon),
        itemCount: manualListData.data.rooms.length,
      ),
    );
  }
}
