import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 108.h,
      onPress: () {},
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 핵심
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImage.squareAvatar(
                imageUrl: widget.profilePicture.toString(),
                size: 36.w,
              ),
              SizedBox(width: 10.w),
              Text(
                widget.nickName,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppTypography.fontSizeLarge.sp,
                  fontWeight: AppTypography.fontWeightBold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 71.w,
                height: 33.h,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    '요청',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: AppTypography.fontSizeExtraSmall.sp,
                      fontWeight: AppTypography.fontWeightSemibold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              SizedBox(
                width: 71.w,
                height: 33.h,
                child: OutlinedButton(
                  onPressed: () {
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    '차단',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: AppTypography.fontSizeExtraSmall.sp,
                      fontWeight: AppTypography.fontWeightSemibold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
