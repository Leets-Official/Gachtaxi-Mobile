import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:gachtaxi_app/domain/my-page/providers/my-info/account_modify_provider.dart';

class AccountNumberModifyScreen extends ConsumerWidget {
  AccountNumberModifyScreen({super.key});

  final TextEditingController accountController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountModifyState = ref.watch(accountModifyProvider);
    final isLoading = accountModifyState is AsyncLoading;

    return DefaultLayout(
      title: '계좌번호',
      hasAppBar: true,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSpacing.spaceCommon,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                label: '계좌번호',
                hintText: '기존 번호', // 추후 동기화
                controller: accountController,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Button(
                isLoading: isLoading,
                buttonText: '변경하기',
                onPressed: () async {
                  final account = accountController.text.trim();

                  if (account.isEmpty) {
                    ToastShowUtils(context: context)
                        .showSuccess('계좌번호를 입력해주세요!');
                    return;
                  }

                  try {
                    await ref
                        .read(accountModifyProvider.notifier)
                        .updateAccount(account);
                    if (context.mounted) {
                      Navigator.pop(context);
                      ToastShowUtils(context: context).showSuccess('변경되었어요');
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ToastShowUtils(context: context).showSuccess('변경에 실패했어요');
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
