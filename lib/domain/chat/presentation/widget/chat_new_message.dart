import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';

import '../../../../common/constants/typography.dart';

class NewMessagesIndicator extends StatelessWidget {
  const NewMessagesIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              color: AppColors.darkGray,
            ),
          ),
          const Text(
            "New Messages",
            style: TextStyle(
              color: AppColors.darkGray, // 연한 회색
              fontSize: AppTypography.fontSizeExtraSmall,
              fontWeight: AppTypography.fontWeightMedium,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              color: AppColors.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
