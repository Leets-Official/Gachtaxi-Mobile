import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required TabController? tabController,
    required int selectedIndex,
  })  : _tabController = tabController,
        _selectedIndex = selectedIndex;

  final TabController? _tabController;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      padding: const EdgeInsets.only(bottom: 20),
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white54,
      tabs: [
        Tab(
          icon: SvgPicture.asset(
            _selectedIndex == 0
                ? 'assets/icons/taxi_on_icon.svg'
                : 'assets/icons/taxi_off_icon.svg',
            width: 30,
            height: 17,
          ),
          text: '홈',
        ),
        Tab(
          icon: SvgPicture.asset(
            'assets/icons/manual_matching_icon.svg',
            width: 23,
            height: 23,
            colorFilter: _selectedIndex == 1
                ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                : null,
          ),
          text: '수동매칭',
        ),
        Tab(
          icon: SvgPicture.asset(
            'assets/icons/friend_icon.svg',
            width: 23,
            height: 23,
            colorFilter: _selectedIndex == 2
                ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                : null,
          ),
          text: '친구',
        ),
        Tab(
          icon: SvgPicture.asset(
            'assets/icons/profile_icon.svg',
            width: 24,
            height: 24,
          ),
          text: '프로필',
        ),
      ],
    );
  }
}
