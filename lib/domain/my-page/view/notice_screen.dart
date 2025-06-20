import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/my-page/providers/notice/notice_data_provider.dart';

class NoticeScreen extends ConsumerWidget {
  final int noticeId;

  const NoticeScreen({super.key, required this.noticeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noticeState = ref.watch(noticeDataNotifierProvider(noticeId));

    return DefaultLayout(
      title: '상세공지',
      hasAppBar: true,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSpacing.spaceExtraLarge,
          ),
          child: noticeState.when(
            data: (response) {
              final notice = response.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.spaceCommon,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '[공지] ${notice!.title}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: AppTypography.fontSizeLarge,
                            fontWeight: AppTypography.fontWeightSemibold,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.spaceExtraSmall),
                        Text(
                          notice.createDate,
                          style: const TextStyle(
                            color: AppColors.darkGray,
                            fontSize: AppTypography.fontSizeMedium,
                            fontWeight: AppTypography.fontWeightRegular,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.spaceCommon),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.spaceSmall),
                  const Divider(
                    thickness: 0.5,
                  ),
                  const SizedBox(height: AppSpacing.spaceCommon),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.spaceCommon,
                    ),
                    child: Text(
                      notice.content,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: AppTypography.fontSizeLarge,
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (error, stack) => Center(
              child: Text(
                '공지사항을 불러오지 못했습니다.\n$error',
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
