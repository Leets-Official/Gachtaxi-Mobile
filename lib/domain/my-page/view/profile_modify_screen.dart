import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:gachtaxi_app/domain/my-page/providers/my-info/info_modify_provider.dart';
import 'package:gachtaxi_app/domain/sign-up/components/profile_upload.dart';

class ProfileModifyScreen extends ConsumerWidget {
  ProfileModifyScreen({super.key});
  final TextEditingController nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infoModifyState = ref.watch(infoModifyProvider);
    final isLoading = infoModifyState is AsyncLoading;

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
              const Expanded(
                child: SizedBox(),
              ),
              Button(
                isLoading: isLoading,
                buttonText: '변경하기',
                onPressed: () async {
                  final nickName = nicknameController.text.trim();
                  final profile = null; // 프로필 아바타 컴포넌트 완성 후 처리

                  if (nickName.isEmpty && profile == null) {
                    ToastShowUtils(context: context)
                        .showSuccess('변경된 부분이 없어요!');
                    return;
                  }

                  try {
                    await ref
                        .read(infoModifyProvider.notifier)
                        .updateInfo(profile, nickName);

                    if (context.mounted) {
                      Navigator.pop(context);
                      ToastShowUtils(context: context).showSuccess('변경되었어요');
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ToastShowUtils(context: context)
                          .showSuccess('변경 실패: ${e.toString()}');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
