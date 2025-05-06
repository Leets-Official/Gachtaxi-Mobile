import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/manual_matching_card.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/no_matching_viewer.dart';
import 'package:gachtaxi_app/domain/home/providers/response/manual_matching_data_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';
import 'package:gachtaxi_app/domain/home/services/my_matching_room_service.dart';

class MyMatchingCategoryScreen extends ConsumerWidget {
  final bool isManualMatching;

  const MyMatchingCategoryScreen(this.isManualMatching, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myMatchingState = ref.watch(
        matchingDataNotifierProvider(MyMatchingRoomService.fetchMatchingRooms));
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.basicHeight * 1.3;

    return SizedBox(
        width: double.infinity,
        height: isExpanded ? MediaQuery.of(context).size.height * 0.68 : 220,
        child: RefreshIndicator(
          onRefresh: () async {
            await ref
                .read(matchingDataNotifierProvider(
                        MyMatchingRoomService.fetchMatchingRooms)
                    .notifier)
                .refresh();
          },
          child: myMatchingState.when(
            data: (response) {
              final myMatchingData = response.data;
              if (myMatchingData == null || myMatchingData.rooms.isEmpty) {
                return const NoMatchingViewer();
              }

              return ListView.separated(
                padding: EdgeInsets.only(bottom: AppSpacing.spaceCommon * 2.5),
                itemBuilder: (context, index) {
                  final room = myMatchingData.rooms[index];

                  if (index == myMatchingData.rooms.length - 1 &&
                      !myMatchingData.pageable.isLast) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref
                          .read(matchingDataNotifierProvider(
                                  MyMatchingRoomService.fetchMatchingRooms)
                              .notifier)
                          .fetchMoreData();
                    });
                  }

                  return ManualMatchingCard(
                    matchingRoom: room,
                    isManualMatching: isManualMatching,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppSpacing.spaceCommon),
                itemCount: myMatchingData.rooms.length,
              );
            },
            error: (error, stackTrace) {
              final errorMessage = error.toString();
              return Center(
                  child: Text(
                errorMessage,
                style: TextStyle(
                  color: AppColors.lightGray,
                  fontSize: AppTypography.fontSizeLarge,
                ),
              ));
            },
            loading: () => Center(
                child: CircularProgressIndicator(
              color: AppColors.lightGray,
            )),
          ),
        ));
  }
}
