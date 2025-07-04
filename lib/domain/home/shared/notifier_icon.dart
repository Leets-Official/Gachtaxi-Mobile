import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/notification-list/providers/unread_notification_provider.dart';
import 'package:gachtaxi_app/domain/notification-list/view/notification_list_screen.dart';

class NotifierIcon extends ConsumerWidget {
  const NotifierIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unreadNotiState = ref.watch(unreadNotificationNotifierProvider);

    return Stack(
      children: [
        IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                SlidePageRoute(
                  screen: const NotificationListScreen(),
                ),
              );

              ref.invalidate(unreadNotificationNotifierProvider);
            },
            icon: SvgPicture.asset(
              'assets/icons/notification_icon.svg',
              width: 20,
              height: 24,
            )),
        unreadNotiState.when(
          data: (data) {
            if (data.data!.unreadCount > 0) {
              return Positioned(
                top: 10,
                right: 12,
                child: Container(
                  width: 10,
                  height: 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFF3636),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          loading: () => const SizedBox.shrink(),
          error: (e, s) => const SizedBox.shrink(),
        ),
      ],
    );
  }
}
