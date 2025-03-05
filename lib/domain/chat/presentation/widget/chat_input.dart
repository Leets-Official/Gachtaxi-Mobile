import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_input_notifier.dart';

class ChatInputField extends ConsumerStatefulWidget {
  const ChatInputField({super.key});

  @override
  ChatInputFieldState createState() => ChatInputFieldState();
}

class ChatInputFieldState extends ConsumerState<ChatInputField> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final chatController = ref.watch(chatInputNotifierProvider);
    final chatNotifier = ref.read(chatInputNotifierProvider.notifier);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.neutralComponent,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
        child: Row(
          children: [
            // 추가 액션 버튼
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.secondaryLight,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                padding: EdgeInsets.zero,
                onPressed: () {
                  // TODO: 추가 액션
                },
              ),
            ),

            SizedBox(width: 7.w),

            // 입력창
            Expanded(
              child: Container(
                width: 250.w,
                constraints: BoxConstraints(
                  minHeight: 36.h,
                  maxHeight: 100.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.chatInputField,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: TextField(
                    controller: chatController,
                    scrollController: _scrollController,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    cursorColor: AppColors.lightGray,
                    cursorWidth: 1.5.w,
                    cursorHeight: 16.h,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    expands: false,
                    decoration: InputDecoration(
                      hintText: "메시지 입력",
                      hintStyle: TextStyle(
                        color: AppColors.chatInputFieldHintText,
                        fontSize: AppTypography.fontSizeSmall.sp,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
                    ),
                    onChanged: (_) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                      });
                    },
                    onSubmitted: (_) => chatNotifier.submitMessage(),
                  ),
                ),
              ),
            ),

            SizedBox(width: 7.w),

            // 보내기 버튼
            Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.send, color: Colors.black),
                padding: EdgeInsets.zero,
                onPressed: chatNotifier.submitMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
