import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class NoMatchingViewer extends StatelessWidget {
  const NoMatchingViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/no_list_icon.svg',
            width: 90,
            height: 90,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            '매칭 내역이 없어요',
            style: TextStyle(
              color: AppColors.darkGray,
              fontSize: AppTypography.fontSizeMedium,
              fontWeight: AppTypography.fontWeightMedium,
            ),
          )
        ],
      ),
    );
  }
}
