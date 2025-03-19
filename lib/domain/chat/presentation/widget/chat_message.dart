import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/util/modal_util.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_profile_modal.dart';
import 'package:intl/intl.dart';

class ChatMessage extends StatelessWidget {
  final ChatMessageModel message;
  final bool isMine;
  final bool showProfileAndName;
  final bool showTime;

  const ChatMessage({
    super.key,
    required this.message,
    required this.isMine,
    required this.showProfileAndName,
    required this.showTime,
  });

  // 읽기 전용
  Color get bubbleColor => isMine ? AppColors.primaryTag : AppColors.neutralComponent;
  Color get messageTextColor => isMine ? AppColors.black : AppColors.white;
  Color get timeColor => AppColors.darkGray;

  // 시간 형식 설정 [오후10:10]
  String get formattedTime => DateFormat('ah:mm', 'ko')
      .format(message.timeStamp);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // 상대방 메시지일 경우 프로필과 이름 표시
          if (!isMine && showProfileAndName)... [
            _buildProfileAndName(context)
          ] else SizedBox(width: 48.w), // 프로필이 없는 경우에도 간격 유지

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMine && showProfileAndName) _buildSenderName(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (isMine) _buildTimeAndUnreadCount(
                      leftPadding: 0,
                      rightPadding: 6,
                      alignment: CrossAxisAlignment.end), // 내 메시지라면 시간을 좌측에 표시
                  _buildMessageBubble(),
                  if (!isMine) _buildTimeAndUnreadCount(
                      leftPadding: 6,
                      rightPadding: 0,
                      alignment: CrossAxisAlignment.start), // 내 메시지가 아니라면 시간을 우측에 표시
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 프로필 이미지 및 이름 표시 메서드
  Widget _buildProfileAndName(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showProfileModal(context);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: CircleAvatar(
          radius: 19.r,
          backgroundColor: AppColors.darkGray,
          foregroundImage: (message.profilePicture != null && message.profilePicture!.isNotEmpty)
              ? NetworkImage(message.profilePicture!)
              : null,
          child: (message.profilePicture == null || message.profilePicture!.isEmpty)
              ? SvgPicture.asset("assets/icons/unknown.svg")
              : null,
        ),
      ),
    );
  }

  // 발신자 이름 표시 메서드
  Widget _buildSenderName() {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Text(
        message.senderName,
        style: TextStyle(
          color: Colors.white,
          fontSize: AppTypography.fontSizeExtraSmall.sp,
          fontWeight: AppTypography.fontWeightMedium,
        ),
      ),
    );
  }

  // 말풍선 메시지 UI
  Widget _buildMessageBubble() {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 6.h, 12.w, 6.h),
      constraints: BoxConstraints(
        maxWidth: 0.6.sw,
        minHeight: 34.h,
      ),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        message.message!,
        style: TextStyle(
          color: messageTextColor,
          fontSize: AppTypography.fontSizeSmall.sp,
          height: 1.1.h,
        ),
      ),
    );
  }

  // 시간 및 읽지 않은 메시지 개수 표시 메서드
  Widget _buildTimeAndUnreadCount({
    required double leftPadding,
    required double rightPadding,
    required CrossAxisAlignment alignment
  }) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          if (showTime) ...[
            if (message.unreadCount! > 0) ...[
              Text(
                message.unreadCount.toString(),
                style: TextStyle(
                    color: AppColors.primaryTag,
                    fontSize: AppTypography.fontSizeExtraExtraSmall.sp),
              ),
              Text(
                formattedTime,
                style: TextStyle(
                    color: timeColor,
                    fontSize: AppTypography.fontSizeExtraExtraSmall.sp),
              ),
            ]
          ],
        ],
      ),
    );
  }

  void _showProfileModal(BuildContext context) {
    showCustomModal(
      context: context,
      child: ChatProfileModal(message: message),
    );
  }
}


