import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderToggle extends StatelessWidget {
  final String selectedGender;
  final Function(String) onGenderChanged;

  const GenderToggle({
    Key? key,
    required this.selectedGender,
    required this.onGenderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 50.h,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputGrey, width: 1),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onGenderChanged("남"),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedGender == "남" ? AppColors.primary : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  ),
                  border: Border(
                    right: BorderSide(color: AppColors.inputGrey, width: 1),
                  ),
                ),
                child: Center(
                  child: Text(
                    "남",
                    style: TextStyle(
                      fontSize: AppTypography.fontSizeExtraLarge,
                      fontWeight: AppTypography.fontWeightSemibold,
                      color: selectedGender == "남" ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: () => onGenderChanged("여"),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedGender == "여" ? AppColors.primary : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Center(
                  child: Text(
                    "여",
                    style: TextStyle(
                      fontSize: AppTypography.fontSizeExtraLarge,
                      fontWeight: AppTypography.fontWeightSemibold,
                      color: selectedGender == "여" ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
