import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/util/modal_util.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_user.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_user_dummy.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_profile_modal.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/profile_image.dart';

class ChatMember extends StatefulWidget {
  const ChatMember({super.key});

  @override
  ChatMemberState createState() => ChatMemberState();
}

class ChatMemberState extends State<ChatMember> {
  double _positionX = -1.0; // 처음엔 오른쪽 끝에 배치

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _positionX = 0.0; // 오른쪽에서 슬라이드 인
      });
    });
  }

  void _close() {
    setState(() {
      _positionX = -1.0; // 다시 오른쪽 끝으로 이동
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.pop(context);
    });
  }

  final List<ChatUserModel> users = ChatUserDummy.generateUserDummy();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _close,
          child: Container(
            color: AppColors.black.withAlpha(100),
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 230),
          right: MediaQuery.of(context).size.width * _positionX,
          top: 0,
          bottom: 0,
          child: Container(
            width: 300.w,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.neutralComponent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildUserList(),
                _buildExitButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Text(
        '대화 상대',
        style: TextStyle(
          color: AppColors.white,
          fontSize: AppTypography.fontSizeExtraLarge.sp,
          fontWeight: AppTypography.fontWeightBold,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildUserList() {
    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return _buildUserTile(users[index]);
        },
      ),
    );
  }

  Widget _buildUserTile(ChatUserModel user) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () {
                  showCustomModal(
                    context: context,
                    child: ChatProfileModal(
                      profilePicture: user.profilePicture,
                      nickName: user.name,
                    ),
                  );
                },
                child: ProfileImage.circleAvatar(
                  imageUrl: user.profilePicture,
                  size: 18,
                ),
              ),
              if (user.isOwner)
                Positioned(
                  right: -6.w,
                  bottom: -1.h,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.black,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.w),
                      child: SvgPicture.asset(
                        "assets/icons/crown.svg",
                        width: 16.w,
                        height: 16.h,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          Text(
            user.name,
            style: TextStyle(
              color: AppColors.white,
              fontSize: AppTypography.fontSizeMedium.sp,
              fontWeight: AppTypography.fontWeightMedium,
              decoration: TextDecoration.none,
            ),
          ),
          if (user.isMe)
            Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(13.r),
                ),
                child: Text(
                  '나',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: AppTypography.fontSizeExtraSmall.sp,
                    fontWeight: AppTypography.fontWeightSemibold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExitButton() {
    return Container(
      width: double.infinity,
      height: 50.h,
      color: AppColors.neutralDark,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 16.w),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/exit.svg",
              width: 30.w,
              height: 30.h,
            ),
            onPressed: _close,
          ),
        ],
      ),
    );
  }
}
