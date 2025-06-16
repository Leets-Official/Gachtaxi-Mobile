import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_input_action_notifier.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_input_text_notifier.dart';

class ChatInputField extends ConsumerStatefulWidget {
  final FocusNode focusNode;

  const ChatInputField({required this.focusNode, super.key});

  @override
  ChatInputFieldState createState() => ChatInputFieldState();
}

class ChatInputFieldState extends ConsumerState<ChatInputField> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final chatController = ref.watch(chatInputTextNotifierProvider);
    final chatNotifier = ref.read(chatInputTextNotifierProvider.notifier);

    final actionState = ref.watch(chatInputActionNotifierProvider);
    final actionNotifier = ref.read(chatInputActionNotifierProvider.notifier);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.charcoalGray,
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
                color: AppColors.singleGray,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  actionState.isExpanded ? Icons.close : Icons.add,
                  color: Color(0xFFD9D9D9),
                ),
                padding: EdgeInsets.zero,
                onPressed: actionNotifier.toggleExpanded,
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
                  color: AppColors.singleGray,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: TextField(
                  controller: chatController,
                  focusNode: widget.focusNode,
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
                  onSubmitted: (_) => chatNotifier.submitMessage(),
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
