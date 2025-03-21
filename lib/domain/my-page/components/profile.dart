import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class Pofile extends StatelessWidget {
  const Pofile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/profile_on_icon.svg',
          width: 56,
          height: 56,
        ),
        const SizedBox(
          width: AppSpacing.spaceCommon,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '닉네임',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeLarge,
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    iconSize: 20,
                    foregroundColor: Colors.white,
                  ),
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: Icon(
                    Icons.create_rounded,
                  ),
                )
              ],
            ),
            Text(
              '202020200',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: AppTypography.fontWeightSemibold),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        )
      ],
    );
  }
}
