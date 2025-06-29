import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: AppColors.neutralBorder,
      ))),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.white54,
        selectedLabelStyle: TextStyle(
          fontSize: AppTypography.fontSizeExtraSmall,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: AppTypography.fontSizeExtraSmall,
        ),
        backgroundColor: AppColors.neutralDark,
        elevation: 0,
        items: [
          _buildItem(
            label: '홈',
            activeIcon: 'assets/icons/taxi_on_icon.svg',
            inactiveIcon: 'assets/icons/taxi_off_icon.svg',
            index: 0,
          ),
          _buildItem(
            label: '수동매칭',
            activeIcon: 'assets/icons/matching_on_icon.svg',
            inactiveIcon: 'assets/icons/manual_matching_icon.svg',
            index: 1,
          ),
          _buildItem(
            label: '친구',
            activeIcon: 'assets/icons/friend_on_icon.svg',
            inactiveIcon: 'assets/icons/friend_icon.svg',
            index: 2,
          ),
          _buildItem(
            label: '프로필',
            activeIcon: 'assets/icons/profile_on_icon.svg',
            inactiveIcon: 'assets/icons/profile_icon.svg',
            index: 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({
    required String label,
    required String activeIcon,
    String? inactiveIcon,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: SvgPicture.asset(
          isSelected ? activeIcon : (inactiveIcon ?? activeIcon),
          width: 24,
          height: 24,
        ),
      ),
      label: label,
    );
  }
}
