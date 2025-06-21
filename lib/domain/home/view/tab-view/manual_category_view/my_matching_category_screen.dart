import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/manual_matching_card.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/no_matching_viewer.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_room_model.dart';
import 'package:gachtaxi_app/domain/home/providers/response/manual_matching_data_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';
import 'package:intl/intl.dart';

class MyMatchingCategoryScreen extends ConsumerWidget {
  final bool isManualMatching;
  const MyMatchingCategoryScreen(this.isManualMatching, {super.key});

  String _formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
    String weekDay = DateFormat('E', 'ko_KR').format(dateTime);
    String monthDay = DateFormat('M.dd', 'ko_KR').format(dateTime);

    return '$monthDay.$weekDay';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myMatchingState =
        ref.watch(matchingDataNotifierProvider(MatchingCategory.my));
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.basicHeight * 1.3;

    return SizedBox(
      width: double.infinity,
      height: isExpanded ? MediaQuery.of(context).size.height * 0.68 : 220,
      child: myMatchingState.when(
        data: (response) {
          final myMatchingData = response.data;
          if (myMatchingData == null || myMatchingData.rooms.isEmpty) {
            return ListView(
              padding: EdgeInsets.zero,
              reverse: true,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                NoMatchingViewer(),
              ],
            );
          }

          // 날짜별 그룹핑
          final Map<String, List<MatchingRoom>> groupedRooms = {};
          for (final room in myMatchingData.rooms) {
            final date = room.departureDate!;
            if (!groupedRooms.containsKey(date)) {
              groupedRooms[date] = [];
            }
            groupedRooms[date]!.add(room);
          }

          // 헤더/룸 리스트로 변환
          final List<_DateOrRoom> items = [];
          groupedRooms.forEach((date, rooms) {
            items.add(_DateOrRoom.header(date));
            items.addAll(rooms.map((room) => _DateOrRoom.room(room)));
          });

          return ListView.builder(
            padding: EdgeInsets.only(bottom: AppSpacing.spaceCommon * 2.5),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              if (item.isHeader) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    bottom: 8.0,
                    top: 16.0,
                  ),
                  child: Text(
                    _formatDateTime(item.date!),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                );
              } else {
                if (index == items.length - 1 &&
                    !myMatchingData.pageable.isLast) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref
                        .read(matchingDataNotifierProvider(MatchingCategory.my)
                            .notifier)
                        .fetchMore();
                  });
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 8.0),
                  child: ManualMatchingCard(
                    matchingRoom: item.room!,
                    isManualMatching: isManualMatching,
                  ),
                );
              }
            },
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
    );
  }
}

// 날짜/룸 구분용 클래스 (ManualMatchingCategoryScreen과 동일)
class _DateOrRoom {
  final String? date;
  final MatchingRoom? room;

  bool get isHeader => date != null;

  _DateOrRoom.header(this.date) : room = null;
  _DateOrRoom.room(this.room) : date = null;
}
