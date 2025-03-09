import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class ManualMatchingCard extends StatelessWidget {
  const ManualMatchingCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cardListElement = [
      '반갑다',
      '하이',
      '반갑다',
    ];

    return Container(
      width: double.infinity,
      height: 164.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.neutralComponent,
      ),
      child: Padding(
          padding: const EdgeInsets.all(AppSpacing.spaceCommon),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MatchingInfo(),
              _Route(),
              _TagList(cardListElement: cardListElement),
            ],
          )),
    );
  }
}

class _MatchingInfo extends StatelessWidget {
  const _MatchingInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // CircleAvatar(
            //   backgroundImage: NetworkImage(''),
            // )
            SvgPicture.asset(
              'assets/icons/profile_on_icon.svg',
              width: 32.w,
              height: 32.h,
            ),
            const SizedBox(
              width: AppSpacing.spaceSmall,
            ),
            Text(
              '03.01(화) 오전 09:00',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: AppTypography.fontWeightSemibold,
                  fontSize: AppTypography.fontSizeSmall),
            )
          ],
        ),
        Text(
          '3/4',
          style: TextStyle(
              color: Colors.white,
              fontWeight: AppTypography.fontWeightSemibold,
              fontSize: AppTypography.fontSizeMedium),
        ),
      ],
    );
  }
}

class _Route extends StatelessWidget {
  const _Route({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/start_to_end_icon.svg',
            width: 11.w,
            height: 38.h,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '가천대 정문',
                style: TextStyle(
                    color: AppColors.darkGray,
                    fontWeight: AppTypography.fontWeightMedium,
                    fontSize: AppTypography.fontSizeSmall),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  'ai 공학관',
                  style: TextStyle(
                      color: AppColors.darkGray,
                      fontWeight: AppTypography.fontWeightMedium,
                      fontSize: AppTypography.fontSizeSmall),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

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
          '# $elementTitle',
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
