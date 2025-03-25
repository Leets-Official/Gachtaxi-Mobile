import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

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
    final platform = Theme.of(context).platform;
    return TabBar(
      controller: _tabController,
      padding: platform == TargetPlatform.iOS
          ? const EdgeInsets.only(bottom: 20)
          : null,
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      labelColor: AppColors.primary,
      labelStyle: TextStyle(
        fontSize: AppTypography.fontSizeExtraSmall,
      ),
      unselectedLabelColor: Colors.white54,
      tabs: [
        _buildTab(
          activeIcon: 'assets/icons/taxi_on_icon.svg',
          inactiveIcon: 'assets/icons/taxi_off_icon.svg',
          label: '홈',
          index: 0,
          width: 34,
          height: 20,
        ),
        _buildTab(
          activeIcon: 'assets/icons/matching_on_icon.svg',
          inactiveIcon: 'assets/icons/manual_matching_icon.svg',
          label: '수동매칭',
          index: 1,
          width: 23,
          height: 23,
        ),
        _buildTab(
          activeIcon: 'assets/icons/friend_on_icon.svg',
          inactiveIcon: 'assets/icons/friend_icon.svg',
          label: '친구',
          index: 2,
          width: 23,
          height: 23,
        ),
        _buildTab(
          activeIcon: 'assets/icons/profile_icon.svg',
          label: '프로필',
          index: 3,
          width: 24,
          height: 24,
        ),
      ],
    );
  }

  Tab _buildTab({
    required String activeIcon,
    String? inactiveIcon,
    required String label,
    required int index,
    double width = 24,
    double height = 24,
  }) {
    return Tab(
      icon: SvgPicture.asset(
        _selectedIndex == index || inactiveIcon == null
            ? activeIcon
            : inactiveIcon,
        width: width,
        height: height,
      ),
      text: label,
    );
  }
}
