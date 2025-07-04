import 'package:flutter/material.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';

abstract class NotificationUiStrategy {
  Widget buildTile(BuildContext context, NotificationModel model);
}
