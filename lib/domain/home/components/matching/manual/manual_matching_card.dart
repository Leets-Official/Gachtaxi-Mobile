import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/util/modal_utils.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/send_my_matching_screen_modal.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_room_model.dart';
import 'package:gachtaxi_app/domain/home/services/manual_matching_join_service.dart';
import 'package:intl/intl.dart';

class ManualMatchingCard extends ConsumerStatefulWidget {
  final MatchingRoom matchingRoom;
  final bool isManualMatching;

  const ManualMatchingCard({
    super.key,
    required this.matchingRoom,
    required this.isManualMatching,
  });

  @override
  ConsumerState<ManualMatchingCard> createState() => _ManualMatchingCardState();
}

class _ManualMatchingCardState extends ConsumerState<ManualMatchingCard> {
  late bool isExpand;
  late bool showExpandedContent;

  @override
  void initState() {
    super.initState();
    isExpand = false; // 초기값 설정
    showExpandedContent = false;
  }

  @override
  Widget build(BuildContext context) {
    final joinState = ref.watch(manualMatchingJoinServiceProvider);
    final isLoading = joinState is AsyncLoading;

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
              maxHeight: isExpand ? 352.h : 164.h,
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
                  SizedBox(
                    height: 16.0,
                  ),
                  _Route(
                    matchingRoom: widget.matchingRoom,
                    isExpand: showExpandedContent,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _TagList(
                      tags: widget.matchingRoom.tags,
                    ),
                  ),
                  if (showExpandedContent && widget.isManualMatching)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: AppSpacing.spaceCommon),
                      child: Button(
                        isLoading: isLoading,
                        buttonText: '참여하기',
                        onPressed: () async {
                          final notifier = ref
                              .read(manualMatchingJoinServiceProvider.notifier);
                          await notifier.join(widget.matchingRoom.roomId);

                          final response =
                              ref.read(manualMatchingJoinServiceProvider);

                          response.when(
                            data: (data) {
                              if (data?.code == 200 && context.mounted) {
                                ModalUtils.showCommonBottomSheet(
                                  context: context,
                                  content: SendMyMatchingScreenModal(),
                                );
                              } else {
                                debugPrint('매칭방 참여 실패 : ${data?.message}');
                              }
                            },
                            loading: () => debugPrint("참여 중..."),
                            error: (e, _) => debugPrint('매칭방 참여 실패 : $e'),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileImage(
              matchingRoom.profilePicture,
            ),
            SizedBox(
              width: AppSpacing.spaceMedium,
            ),
            _buildRow(
              _formatDateTime(matchingRoom.departureTime),
              '${matchingRoom.currentMembers}/${matchingRoom.maxCapacity}',
            ),
          ],
        ),
      ],
    );
  }

  Expanded _buildRow(String leftText, String rightText) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leftText,
                style: _buildTextStyle(
                  fontSize: AppTypography.fontSizeMedium,
                  fontWeight: AppTypography.fontWeightBold,
                ),
              ),
              if (isExpand) ...[
                Text(
                  '${matchingRoom.nickname}',
                  style: _buildTextStyle(
                    fontSize: AppTypography.fontSizeExtraSmall,
                  ),
                ),
              ]
            ],
          ),
          Text(
            rightText,
            style: _buildTextStyle(
              fontSize: AppTypography.fontSizeSmall,
              fontWeight: AppTypography.fontWeightSemibold,
            ),
          ),
        ],
      ),
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

  String _formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
    String formattedTime = DateFormat('a hh:mm', 'ko_KR').format(dateTime);

    return formattedTime;
  }
}

// 매칭 카드의 경로, 확장시 설명까지 렌더링하는 UI
class _Route extends StatefulWidget {
  final MatchingRoom matchingRoom;
  final bool isExpand;

  const _Route({super.key, required this.matchingRoom, required this.isExpand});

  @override
  State<_Route> createState() => _RouteState();
}

class _RouteState extends State<_Route> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: widget.isExpand
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/start_to_end_icon.svg',
                  width: 11.w, height: 48.h),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.matchingRoom.departure,
                    style: _buildTextStyle(
                      color: AppColors.darkGray,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.matchingRoom.destination,
                    style: _buildTextStyle(
                      color: AppColors.darkGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (widget.isExpand) ...[
            const SizedBox(
              height: AppSpacing.spaceCommon,
            ),
            SizedBox(
              height: 60.h,
              child: SingleChildScrollView(
                child: Text(
                  widget.matchingRoom.description.isEmpty
                      ? '추가된 내용이 없습니다.'
                      : widget.matchingRoom.description,
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
      child: tags.isNotEmpty
          ? ListView.separated(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (context, index) => ListElement(
                elementTitle: tags[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
            )
          : Text(
              '태그가 없습니다',
              style: TextStyle(
                color: AppColors.darkGray,
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
