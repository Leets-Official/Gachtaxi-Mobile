import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gachtaxi_app/domain/notification/presentation/widget/notification_overlay_banner.dart';
import 'package:gachtaxi_app/main.dart';

class NotificationOverlay {
  static OverlayEntry? _entry;
  static bool _isShowing = false;

  static void show({
    required String title,
    required String body,
  }) {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) {
      return;
    }

    if (_isShowing) {
      remove();
    }

    _entry = OverlayEntry(
      builder: (context) {

        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: NotificationOverlayBanner(
            title: title,
            message: body,
            onClose: remove,
          ),
        );
      },
    );

    overlay.insert(_entry!);
    _isShowing = true;
  }

  static void remove() {
    _entry?.remove();
    _entry = null;
    _isShowing = false;
  }
}
