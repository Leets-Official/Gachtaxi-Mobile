import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/home/components/custom_bottom_nav_bar.dart';
import 'package:gachtaxi_app/domain/home/view/home_screen.dart';
import 'package:gachtaxi_app/domain/my-page/view/my_page_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final _homeScreen = HomeScreen(
    tabController: _tabController,
  );
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.index == 3) {
      setState(() {
        _selectedIndex = 3;
      });
    } else {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    }
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Offstage(
          offstage: _selectedIndex == 3,
          child: _homeScreen,
        ),
        Offstage(
          offstage: _selectedIndex != 3,
          child: const MyPageScreen(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: CustomBottomNavBar(
        tabController: _tabController,
        selectedIndex: _selectedIndex,
      ),
      child: _buildBody(),
    );
  }
}
