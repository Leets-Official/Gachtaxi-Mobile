import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';
import 'package:gachtaxi_app/domain/notification-list/strategy/notification_list_ui_strategy.dart';

class MatchInviteNotificationStrategy implements NotificationUiStrategy {
  @override
  Widget buildTile(BuildContext context, NotificationModel model) {
    final invite = model as MatchInviteNotification;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Container(
        // padding: const EdgeInsets.only(
        //   bottom: 16,
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
            'assets/icons/taxi_on_icon.svg',
            width: 32,
            height: 32,
          ),
          title: Text(invite.content, style: TextStyle(color: Colors.white)),
          subtitle: Text(_formatTime(invite.createdAt),
              style: TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }

  String _formatTime(String createdAt) {
    return createdAt;
  }
}
