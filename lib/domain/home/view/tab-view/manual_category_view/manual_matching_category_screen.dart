import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/domain/home/components/matching/custom_pull_to_refresh.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/manual_matching_card.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/no_matching_viewer.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_room_model.dart';
import 'package:gachtaxi_app/domain/home/providers/response/manual_matching_data_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';
import 'package:intl/intl.dart';

class ManualMatchingCategoryScreen extends ConsumerStatefulWidget {
  final bool isManualMatching;
  const ManualMatchingCategoryScreen(this.isManualMatching, {super.key});

  @override
  ConsumerState<ManualMatchingCategoryScreen> createState() =>
      _ManualMatchingCategoryScreenState();
}

class _ManualMatchingCategoryScreenState
    extends ConsumerState<ManualMatchingCategoryScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
    String weekDay = DateFormat('E', 'ko_KR').format(dateTime);
    String monthDay = DateFormat('M.dd', 'ko_KR').format(dateTime);

    return '$monthDay.$weekDay';
  }

  @override
  Widget build(BuildContext context) {
    final manualMatchingState =
        ref.watch(matchingDataNotifierProvider(MatchingCategory.manual));
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.basicHeight * 1.3;

    return SizedBox(
        width: double.infinity,
        height: isExpanded ? MediaQuery.of(context).size.height * 0.68 : 220,
        child: CustomPullToRefresh(
          scrollController: _scrollController,
          onRefresh: () async {
            await ref
                .read(matchingDataNotifierProvider(MatchingCategory.manual)
                    .notifier)
                .refresh(MatchingCategory.manual);
          },
          child: manualMatchingState.when(
            data: (response) {
              final manualMatchingData = response.data;
              if (manualMatchingData == null ||
                  manualMatchingData.rooms.isEmpty) {
                return ListView(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    NoMatchingViewer(),
                  ],
                );
              }

              final Map<String, List<MatchingRoom>> groupedRooms = {};
              for (final room in manualMatchingData.rooms) {
                final date = room.departureDate!;
                if (!groupedRooms.containsKey(date)) {
                  groupedRooms[date] = [];
                }
                groupedRooms[date]!.add(room);
              }

              final List<_DateOrRoom> items = [];
              groupedRooms.forEach((date, rooms) {
                items.add(_DateOrRoom.header(date));
                items.addAll(rooms.map((room) => _DateOrRoom.room(room)));
              });

              return ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.only(bottom: AppSpacing.spaceLarge),
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
                        !manualMatchingData.pageable.isLast) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(matchingDataNotifierProvider(
                                    MatchingCategory.manual)
                                .notifier)
                            .fetchMore();
                      });
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 8.0),
                      child: ManualMatchingCard(
                        matchingRoom: item.room!,
                        isManualMatching: widget.isManualMatching,
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
        ));
  }
}

class _DateOrRoom {
  final String? date;
  final MatchingRoom? room;

  bool get isHeader => date != null;

  _DateOrRoom.header(this.date) : room = null;
  _DateOrRoom.room(this.room) : date = null;
}
