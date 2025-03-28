import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class TimePickerCard extends StatefulWidget {
  const TimePickerCard({super.key});

  @override
  State<TimePickerCard> createState() => _TimePickerCardState();
}

class _TimePickerCardState extends State<TimePickerCard> {
  int selectedHour = 8;
  int selectedMinute = 50;
  bool isAM = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 101.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.neutralComponent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.spaceCommon,
        ),
        child: Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '출발 시간',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppTypography.fontSizeMedium,
                  fontWeight: AppTypography.fontWeightRegular,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            // 오전/오후 선택
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 60.w,
                  height: 100.h,
                  child: ListWheelScrollView(
                    itemExtent: 40,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        isAM = index == 0;
                      });
                    },
                    children: [
                      _buildPmText('오후'),
                      _buildPmText('오전'),
                    ],
                  ),
                ),
                // 시간 선택
                SizedBox(
                  width: 60.w,
                  height: 100.h,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedHour = index + 1;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 12,
                      builder: (context, index) {
                        return _buildTimeText('${index + 1}');
                      },
                    ),
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppTypography.fontSizeMedium,
                    fontWeight: AppTypography.fontWeightRegular,
                  ),
                ),
                // 분 선택
                SizedBox(
                  width: 60.w,
                  height: 100.h,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMinute = index * 5;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 12,
                      builder: (context, index) {
                        return _buildTimeText('${index * 5}'.padLeft(2, '0'));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPmText(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.white,
          fontSize: AppTypography.fontSizeMedium,
          fontWeight: AppTypography.fontWeightRegular,
        ),
      ),
    );
  }

  Widget _buildTimeText(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.white,
          fontSize: AppTypography.fontSizeExtraLarge * 1.5,
          fontWeight: AppTypography.fontWeightBold,
        ),
      ),
    );
  }
}
