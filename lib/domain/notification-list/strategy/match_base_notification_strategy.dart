import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/enums/match_type.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';
import 'package:gachtaxi_app/domain/notification-list/strategy/notification_list_ui_strategy.dart';
import 'package:intl/intl.dart';

class MatchBaseNotificationStrategy implements NotificationUiStrategy {
  final MatchType matchType;

  MatchBaseNotificationStrategy({required this.matchType});

  @override
  Widget buildTile(
      BuildContext context, NotificationModel model, WidgetRef ref) {
    final String iconPath;
    final String content;
    final String createdAt;

    if (matchType == MatchType.start && model is MatchStartNotification) {
      iconPath = 'assets/icons/taxi_on_icon.svg';
      content = model.content;
      createdAt = model.createdAt;
    } else if (matchType == MatchType.finish &&
        model is MatchFinishedNotification) {
      iconPath = 'assets/icons/taxi_off_icon.svg';
      content = model.content;
      createdAt = model.createdAt;
    } else {
      return const SizedBox.shrink(); // 혹은 에러 표시 위젯
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Container(
        // padding: const EdgeInsets.only(
        //   bottom: 8,
        // ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.singleGray,
              width: 1,
            ),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            iconPath,
            width: 32,
            height: 32,
          ),
          title: Text(content, style: const TextStyle(color: Colors.white)),
          subtitle: Text(_formatTime(createdAt),
              style: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }

  String _formatTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt).toLocal();
    String formattedTime = DateFormat('a hh:mm', 'ko_KR').format(dateTime);

    return formattedTime;
  }
}
