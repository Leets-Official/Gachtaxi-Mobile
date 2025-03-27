import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      hasAppBar: true,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.spaceCommon),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '친구 요청',
                    style: TextStyle(
                      fontSize: AppTypography.fontSizeExtraLarge * 1.2,
                      fontWeight: AppTypography.fontWeightBold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.spaceExtraLarge),
                  InputField(
                    hintText: '추가할 친구 닉네임을 입력해주세요',
                    controller: TextEditingController(),
                    label: '친구 닉네임',
                    labelFontSize: AppTypography.fontSizeMedium,
                  ),
                  const SizedBox(height: AppSpacing.spaceExtraLarge),
                  Button(
                    buttonText: '요청 하기',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
