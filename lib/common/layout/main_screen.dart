import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/home/components/custom_bottom_nav_bar.dart';
import 'package:gachtaxi_app/domain/home/view/home_screen.dart';
import 'package:gachtaxi_app/domain/my-page/view/my_page_screen.dart';
import 'package:gachtaxi_app/domain/notification-list/providers/unread_notification_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  int previousIndex = 0;

  void _onNavItemTapped(int index) {
    final wasInMyPage = _selectedIndex == 3;

    setState(() {
      if (_selectedIndex != 3) {
        previousIndex = _selectedIndex;
      }
      _selectedIndex = index;
    });

    if (index != 3) {
      wasInMyPage
          ? _pageController.jumpToPage(index)
          : _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    return PopScope(
      canPop: _selectedIndex != 3,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _selectedIndex == 3) {
          setState(() {
            _selectedIndex = previousIndex;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.invalidate(unreadNotificationNotifierProvider);
            });
          });
        }
      },
      child: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex == 3,
            child: RepaintBoundary(
              child: HomeScreen(pageController: _pageController),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const RepaintBoundary(child: MyPageScreen()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
      child: _buildBody(),
    );
  }
}
