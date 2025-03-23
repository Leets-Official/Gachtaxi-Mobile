import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/components/modal.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/profile_image.dart';

class ChatProfileModal extends StatefulWidget {
  final String profilePicture;
  final String nickName;

  const ChatProfileModal({super.key, required this.profilePicture, required this.nickName});

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
          ProfileImage.circleAvatar(
            imageUrl: widget.profilePicture.toString(),
            size: 21,
          ),

          SizedBox(width: 10.w),

          Text(
            widget.nickName,
            style: TextStyle(
              color: AppColors.white,
              fontSize: AppTypography.fontSizeExtraLarge.sp,
              fontWeight: AppTypography.fontWeightBold,
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
