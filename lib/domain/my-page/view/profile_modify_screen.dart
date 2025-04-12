import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:gachtaxi_app/domain/sign-up/components/profile_upload.dart';

class ProfileModifyScreen extends StatelessWidget {
  ProfileModifyScreen({super.key});
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '프로필 수정',
      hasAppBar: true,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSpacing.spaceCommon,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppSpacing.spaceExtraLarge,
                    top: 48.0,
                  ),
                  child: ProfileAvatar()),
              InputField(
                label: '닉네임',
                hintText: '닉네임을 입력해주세요',
                controller: nicknameController,
              ),
              const SizedBox(
                height: AppSpacing.spaceExtraLarge,
              ),
              InputField(
                label: '계좌번호',
                hintText: '계좌번호을 입력해주세요',
                controller: accountController,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Button(
                buttonText: '변경하기',
                onPressed: () {
                  Navigator.pop(context);
                  ToastShowUtils(context: context).showSuccess('변경되었어요');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
