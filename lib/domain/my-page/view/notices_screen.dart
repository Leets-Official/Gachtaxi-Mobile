import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/my-page/components/notice/notice_card.dart';
import 'package:gachtaxi_app/domain/my-page/providers/notice/notices_data_provider.dart';

class NoticesScreen extends ConsumerWidget {
  const NoticesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noticesState = ref.watch(noticesDataNotifierProvider);

    return DefaultLayout(
      title: '공지사항',
      hasAppBar: true,
      child: SafeArea(
        child: noticesState.when(
          data: (response) {
            final noticesData = response.data;
            if (noticesData == null || noticesData.notices.isEmpty) {
              return Center(
                child: Text('데이터가 없습니다.'),
              );
            }

            return ListView.separated(
                itemBuilder: (context, index) {
                  return NoticeCard(
                      noticeId: noticesData.notices[index].noticeId,
                      title: noticesData.notices[index].title,
                      createDate: noticesData.notices[index].createDate);
                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },
                itemCount: noticesData.notices.length);
          },
          error: (error, stackTrace) {
            final errorMessage = error.toString();
            return Center(
                child: Text(
              errorMessage,
              style: TextStyle(
                color: AppColors.lightGray,
                fontSize: AppTypography.fontSizeLarge,
              ),
            ));
          },
          loading: () => Center(
              child: CircularProgressIndicator(
            color: AppColors.lightGray,
          )),
        ),
      ),
    );
  }
}
