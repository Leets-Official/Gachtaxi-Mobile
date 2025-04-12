import 'package:flutter/material.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/auto_matching_screen.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/manual_matching_screen.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/friend_list_screen.dart';

class TabView extends StatelessWidget {
  const TabView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        AutoMatchingScreen(),
        ManualMatchingScreen(),
        FriendListScreen(),
      ],
    );
  }
}
