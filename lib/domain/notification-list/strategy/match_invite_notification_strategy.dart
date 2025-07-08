import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';
import 'package:gachtaxi_app/domain/notification-list/providers/manual_matching_invite_provider.dart';
import 'package:gachtaxi_app/domain/notification-list/strategy/notification_list_ui_strategy.dart';

class MatchInviteNotificationStrategy implements NotificationUiStrategy {
  @override
  Widget buildTile(
      BuildContext context, NotificationModel model, WidgetRef ref) {
    final invite = model as MatchInviteNotification;
    final matchingInviteState = ref.watch(manualMatchingInviteNotifierProvider);
    final isLoading = matchingInviteState.isLoading;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Container(
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
          title: Text(
            invite.content,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Button(
            onPressed: () async {
              if (isLoading) return;

              try {
                await ref
                    .read(manualMatchingInviteNotifierProvider.notifier)
                    .accept(
                        invite.payload.matchingRoomId, invite.notificationId);

                final current = ref.read(manualMatchingInviteNotifierProvider);

                if (current.hasValue && current.value?.code == 200) {
                  if (context.mounted) {
                    ToastShowUtils(context: context)
                        .showSuccess(current.value?.message ?? '수락 완료');
                  }
                } else if (current.hasError) {
                  final errorMessage =
                      current.error.toString().replaceFirst('Exception: ', '');
                  if (context.mounted) {
                    ToastShowUtils(context: context).showSuccess(errorMessage);
                  }
                }
              } catch (e) {
                final errorMessage =
                    e.toString().replaceFirst('Exception: ', '');
                if (context.mounted) {
                  ToastShowUtils(context: context).showSuccess(errorMessage);
                }
              }
            },
            isLoading: isLoading,
            buttonText: '수락',
            width: 71,
            height: 31,
          ),
        ),
      ),
    );
  }
}
