import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';
import 'package:gachtaxi_app/domain/notification-list/strategy/notification_list_ui_strategy.dart';

class FriendRequestNotificationStrategy implements NotificationUiStrategy {
  @override
  Widget buildTile(
      BuildContext context, NotificationModel model, WidgetRef ref) {
    final friendRequest = model as FriendRequestNotification;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
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
            'assets/icons/profile_on_icon.svg',
            width: 48,
            height: 48,
          ),
          title: Text(friendRequest.content,
              style: TextStyle(color: Colors.white)),
          trailing: Button(
            buttonText: '수락',
            width: 71,
            height: 31,
          ),
        ),
      ),
    );
  }
}
