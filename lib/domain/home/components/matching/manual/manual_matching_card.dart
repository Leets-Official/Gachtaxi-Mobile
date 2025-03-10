import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/model/manual_matching_response_model.dart';

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

  @override
  void initState() {
    super.initState();
    isExpand = false; // 초기값 설정
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
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 164.h,
              maxHeight: isExpand ? 310.h : 164.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: isExpand
                  ? Border.all(color: AppColors.primary, width: 1.5.w)
                  : null,
              color: AppColors.neutralComponent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.spaceCommon),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _MatchingInfo(
                      isExpand: isExpand,
                      matchingRoom: widget.matchingRoom,
                    ),
                    _Route(
                      isExpand: isExpand,
                      matchingRoom: widget.matchingRoom,
                    ),
                    _TagList(cardListElement: widget.matchingRoom.tags),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isExpand && widget.isManualMatching) ...[
          SizedBox(height: AppSpacing.spaceCommon),
          Button(buttonText: '참여하기'),
        ]
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${matchingRoom.departureDate}${matchingRoom.departureTime.hour}:${matchingRoom.departureTime.minute}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: AppTypography.fontWeightBold,
                fontSize: AppTypography.fontSizeLarge,
              ),
            ),
            Text(
              '${matchingRoom.currentMembers}/${matchingRoom.maxCapacity}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: AppTypography.fontWeightSemibold,
                fontSize: AppTypography.fontSizeSmall,
              ),
            ),
          ],
        ),
        if (isExpand) ...[
          const SizedBox(
            height: AppSpacing.spaceCommon,
          ),
          Row(
            children: [
              matchingRoom.profilePicture != null
                  ? CircleAvatar(
                      backgroundImage:
                          NetworkImage(matchingRoom.profilePicture!),
                    )
                  : SvgPicture.asset(
                      'assets/icons/profile_on_icon.svg',
                      width: 32.w,
                      height: 32.h,
                    ),
              SizedBox(
                width: AppSpacing.spaceSmall,
              ),
              Text(
                '${matchingRoom.nickname}의 매칭',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: AppTypography.fontWeightSemibold,
                ),
              )
            ],
          )
        ],
      ],
    );
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isExpand)
            SizedBox(
              height: AppSpacing.spaceCommon,
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/start_to_end_icon.svg',
                width: 11.w,
                height: 38.h,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    matchingRoom.departure,
                    style: TextStyle(
                      color: AppColors.darkGray,
                      fontWeight: AppTypography.fontWeightMedium,
                      fontSize: AppTypography.fontSizeSmall,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      matchingRoom.destination,
                      style: TextStyle(
                        color: AppColors.darkGray,
                        fontWeight: AppTypography.fontWeightMedium,
                        fontSize: AppTypography.fontSizeSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isExpand) ...[
            const SizedBox(height: AppSpacing.spaceCommon),
            SizedBox(
              height: 60.h,
              child: SingleChildScrollView(
                child: Text(
                  matchingRoom.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: AppTypography.fontWeightRegular,
                    fontSize: AppTypography.fontSizeSmall,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.spaceCommon),
          ],
        ],
      ),
    );
  }
}

// 태그 리스트 렌더링 UI
class _TagList extends StatelessWidget {
  const _TagList({
    super.key,
    required this.cardListElement,
  });

  final List<String> cardListElement;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cardListElement.length,
        itemBuilder: (context, index) {
          return ListElement(
            elementTitle: cardListElement[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10.w,
          );
        },
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
        return '동성';
      default:
        return tag; // 예기치 않은 태그는 그대로 출력
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(999)),
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceCommon),
        child: Center(
            child: Text(
          '# ${_convertTagToLabel(elementTitle)}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: AppTypography.fontWeightMedium,
            fontSize: AppTypography.fontSizeExtraSmall,
          ),
        )),
      ),
    );
  }
}
