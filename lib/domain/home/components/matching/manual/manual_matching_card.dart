import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_room_model.dart';

class ManualMatchingCard extends StatefulWidget {
  final MatchingRoom matchingRoom;
  final bool isManualMatching;

  const ManualMatchingCard({
    super.key,
    required this.matchingRoom,
    required this.isManualMatching,
  });

  @override
  _ManualMatchingCardState createState() => _ManualMatchingCardState();
}

class _ManualMatchingCardState extends State<ManualMatchingCard> {
  late bool isExpand;
  late bool showExpandedContent;

  @override
  void initState() {
    super.initState();
    isExpand = false; // 초기값 설정
    showExpandedContent = false;
  }

  @override
  void didUpdateWidget(covariant ManualMatchingCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    isExpand = false;
    showExpandedContent = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpand = !isExpand; // 상태 변경
              if (!isExpand) {
                showExpandedContent = false;
              }
            });
          },
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 250),
            onEnd: () {
              if (isExpand) {
                setState(() {
                  showExpandedContent = true;
                });
              }
            },
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 164.h,
              maxHeight: isExpand ? 310.h : 164.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
              border: isExpand
                  ? Border.all(
                      color: AppColors.primary,
                      width: 1.5.w,
                    )
                  : null,
              color: AppColors.neutralComponent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                AppSpacing.spaceCommon,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _MatchingInfo(
                    matchingRoom: widget.matchingRoom,
                    isExpand: showExpandedContent,
                  ),
                  _Route(
                    matchingRoom: widget.matchingRoom,
                    isExpand: showExpandedContent,
                  ),
                  _TagList(
                    tags: widget.matchingRoom.tags,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showExpandedContent && widget.isManualMatching)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.spaceCommon),
            child: Button(buttonText: '참여하기'),
          ),
      ],
    );
  }
}

// 매칭 카드의 시간 및 현재 인원, 확장 시 프로필 이미지와 닉네임까지 렌더링하는는 렌더링 UI
class _MatchingInfo extends StatelessWidget {
  final MatchingRoom matchingRoom;
  final bool isExpand;

  const _MatchingInfo(
      {super.key, required this.matchingRoom, required this.isExpand});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRow(
          '${matchingRoom.departureDate}${matchingRoom.departureTime.hour}:${matchingRoom.departureTime.minute}',
          '${matchingRoom.currentMembers}/${matchingRoom.maxCapacity}',
        ),
        if (isExpand) ...[
          const SizedBox(
            height: AppSpacing.spaceCommon,
          ),
          Row(
            children: [
              _buildProfileImage(
                matchingRoom.profilePicture,
              ),
              SizedBox(
                width: AppSpacing.spaceSmall,
              ),
              Text(
                '${matchingRoom.nickname}의 매칭',
                style: _buildTextStyle(),
              ),
            ],
          ),
          const SizedBox(
            height: AppSpacing.spaceCommon,
          ),
        ],
      ],
    );
  }

  Row _buildRow(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: _buildTextStyle(
            fontSize: AppTypography.fontSizeLarge,
            fontWeight: AppTypography.fontWeightBold,
          ),
        ),
        Text(
          rightText,
          style: _buildTextStyle(
            fontSize: AppTypography.fontSizeSmall,
            fontWeight: AppTypography.fontWeightSemibold,
          ),
        ),
      ],
    );
  }

  TextStyle _buildTextStyle({double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize ?? AppTypography.fontSizeSmall,
      fontWeight: fontWeight ?? AppTypography.fontWeightRegular,
    );
  }

  Widget _buildProfileImage(String? profilePicture) {
    return profilePicture != null
        ? CircleAvatar(
            backgroundImage: NetworkImage(
              profilePicture,
            ),
          )
        : SvgPicture.asset('assets/icons/profile_on_icon.svg',
            width: 32.w, height: 32.h);
  }
}

// 매칭 카드의 경로, 확장시 설명까지 렌더링하는 UI
class _Route extends StatelessWidget {
  final MatchingRoom matchingRoom;
  final bool isExpand;

  const _Route({super.key, required this.matchingRoom, required this.isExpand});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isExpand ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/start_to_end_icon.svg',
                  width: 11.w, height: 38.h),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    matchingRoom.departure,
                    style: _buildTextStyle(
                      color: AppColors.darkGray,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    matchingRoom.destination,
                    style: _buildTextStyle(
                      color: AppColors.darkGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isExpand) ...[
            const SizedBox(
              height: AppSpacing.spaceCommon,
            ),
            SizedBox(
              height: 80.h,
              child: SingleChildScrollView(
                child: Text(
                  matchingRoom.description,
                  style: _buildTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  TextStyle _buildTextStyle({
    Color? color,
    double fontSize = AppTypography.fontSizeSmall,
    FontWeight fontWeight = AppTypography.fontWeightMedium,
  }) {
    return TextStyle(
      color: color ?? Colors.white,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}

class _TagList extends StatelessWidget {
  final List<String> tags;

  const _TagList({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) => ListElement(
          elementTitle: tags[index],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
        ),
      ),
    );
  }
}

class ListElement extends StatelessWidget {
  final String elementTitle;

  const ListElement({super.key, required this.elementTitle});

  String _convertTagToLabel(String tag) {
    switch (tag) {
      case 'NO_SMOKE':
        return '금연';
      case 'ONLY_MALE':
        return '남자만';
      case 'ONLY_FEMALE':
        return '여자만';
      default:
        return tag;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            999,
          ),
        ),
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceCommon,
        ),
        child: Center(
          child: Text('# ${_convertTagToLabel(elementTitle)}',
              style: _buildTextStyle()),
        ),
      ),
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      color: Colors.black,
      fontWeight: AppTypography.fontWeightMedium,
      fontSize: AppTypography.fontSizeExtraSmall,
    );
  }
}
