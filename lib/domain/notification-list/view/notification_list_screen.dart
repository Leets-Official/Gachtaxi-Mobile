import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';
import 'package:gachtaxi_app/domain/notification-list/providers/notification_list_provider.dart';
import 'package:gachtaxi_app/domain/notification-list/strategy/notification_strategy_factory.dart';

class NotificationListScreen extends ConsumerWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationListState = ref.watch(notificationListNotifierProvider);

    return DefaultLayout(
      hasAppBar: true,
      title: '알림',
      child: SafeArea(
        child: notificationListState.when(
          data: (response) {
            final notificationListData = response.data;

            if (notificationListData == null ||
                notificationListData.response.isEmpty) {
              return const Center(
                child: Text('데이터가 없습니다.'),
              );
            }

            // 날짜별 그룹핑
            final Map<String, List<NotificationModel>> groupedNotifications =
                {};
            for (final notification in notificationListData.response) {
              final dateGroup = _getDateGroup(notification.createdAt);
              groupedNotifications.putIfAbsent(dateGroup, () => []);
              groupedNotifications[dateGroup]!.add(notification);
            }

            final List<_GroupOrNotification> items = [];
            for (var group in ['오늘', '최근 7일', '최근 30일']) {
              final notifications = groupedNotifications[group];
              if (notifications != null && notifications.isNotEmpty) {
                items.add(_GroupOrNotification.header(group));
                items.addAll(notifications
                    .map((n) => _GroupOrNotification.notification(n)));
              }
            }

            final hasMore = !(notificationListData.pageable.isLast);
            final itemCount = items.length + (hasMore ? 1 : 0);

            return ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                if (hasMore && index == items.length) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref
                        .read(notificationListNotifierProvider.notifier)
                        .fetchMore();
                  });
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final item = items[index];
                if (item.isHeader) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Text(
                      item.groupTitle!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  );
                } else {
                  final notification = item.notification!;
                  final strategy =
                      NotificationUiStrategyFactory.getStrategy(notification);
                  return KeyedSubtree(
                    key: ValueKey(notification.notificationId),
                    child: strategy.buildTile(context, notification),
                  );
                }
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('오류가 발생했습니다: $e')),
        ),
      ),
    );
  }

  String _getDateGroup(String createdAt) {
    try {
      final nowUtc = DateTime.now().toUtc();
      final todayUtc = DateTime(nowUtc.year, nowUtc.month, nowUtc.day);
      final notificationDateLocal = DateTime.parse(createdAt).toLocal();
      final notificationDayLocal = DateTime(
        notificationDateLocal.year,
        notificationDateLocal.month,
        notificationDateLocal.day,
      );
      final difference = todayUtc.difference(notificationDayLocal).inDays;

      if (difference == 0) {
        return '오늘';
      } else if (difference < 7) {
        return '최근 7일';
      }
      return '최근 30일';
    } catch (e) {
      return '최근 30일';
    }
  }
}

class _GroupOrNotification {
  final String? groupTitle;
  final NotificationModel? notification;

  bool get isHeader => groupTitle != null;

  const _GroupOrNotification.header(this.groupTitle) : notification = null;
  const _GroupOrNotification.notification(this.notification)
      : groupTitle = null;
}
