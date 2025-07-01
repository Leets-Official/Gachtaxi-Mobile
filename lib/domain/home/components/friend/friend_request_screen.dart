import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      hasAppBar: true,
      title: '친구 요청',
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.spaceCommon),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.spaceExtraLarge),
                  InputField(
                    hintText: '닉네임 입력하기',
                    controller: TextEditingController(),
                    label: '친구 닉네임',
                    labelFontSize: AppTypography.fontSizeMedium,
                    hasSearchIcon: true,
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
