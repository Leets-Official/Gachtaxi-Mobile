import 'package:flutter/material.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/auto_matching_screen.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/friend_list_screen.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/manual_matching_screen.dart';

class TabView extends StatefulWidget {
  const TabView({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AutoMatchingScreen(),
        ManualMatchingScreen(),
        FriendListScreen(),
        Container(),
      ],
    );
  }
}
