import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/components/modal.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

class ChatProfileModal extends StatefulWidget {
  final ChatMessageModel message;

  const ChatProfileModal({super.key, required this.message});

  @override
  _ChatProfileModalState createState() => _ChatProfileModalState();
}

class _ChatProfileModalState extends State<ChatProfileModal> {
  bool isFriendAdded = false;

  @override
  Widget build(BuildContext context) {
    return Modal(
      height: 144.h,
      buttonText: "블랙리스트 추가",
      onPress: () {},
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.darkGray,
            foregroundImage: (widget.message.profilePicture != null &&
                widget.message.profilePicture!.isNotEmpty)
                ? NetworkImage(widget.message.profilePicture!)
                : null,
            child: (widget.message.profilePicture == null ||
                widget.message.profilePicture!.isEmpty)
                ? SvgPicture.asset("assets/icons/unknown.svg")
                : null,
          ),

          SizedBox(width: 10.w),

          Text(
            widget.message.senderName,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(width: 16.w),

          IconButton(
            onPressed: () {
              setState(() {
                isFriendAdded = !isFriendAdded;
              });
            },
            icon: SvgPicture.asset(
              isFriendAdded
                  ? "assets/icons/plus_empty_icon.svg"
                  : "assets/icons/plus_fill_icon.svg",
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
    );
  }
}
