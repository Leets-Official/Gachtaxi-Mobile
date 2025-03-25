import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/chat/presentation/view/chat_screen.dart';
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
  int _previousIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_handleTabChange);
    super.dispose();
  }

  void _handleTabChange() {
    if (widget.tabController.index == 3) {
      _previousIndex =
          _previousIndex != 3 ? widget.tabController.previousIndex : 0;
      Future.microtask(() {
        if (!mounted) return;
        Navigator.of(context).push(
          SlidePageRoute(
              screen: ChatScreen(
            roomId: 11,
          )),
        );
        if (mounted) {
          setState(() {
            widget.tabController.index = _previousIndex; // 이전 탭으로 복귀
          });
        }
      });
    }
  }

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
