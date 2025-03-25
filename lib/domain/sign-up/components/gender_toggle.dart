import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Gender { male, female }

extension GenderExtension on Gender {
  String get label {
    switch (this) {
      case Gender.male:
        return "남";
      case Gender.female:
        return "여";
    }
  }
}

class GenderToggle extends StatelessWidget {
  final Gender selectedGender;
  final ValueChanged<Gender> onGenderChanged;

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
              onTap: () => onGenderChanged(Gender.male),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedGender == Gender.male
                      ? AppColors.primary
                      : Colors.transparent,
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
                    Gender.male.label,
                    style: TextStyle(
                      fontSize: AppTypography.fontSizeExtraLarge,
                      fontWeight: AppTypography.fontWeightSemibold,
                      color: selectedGender == Gender.male
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: () => onGenderChanged(Gender.female),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedGender == Gender.female
                      ? AppColors.primary
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Center(
                  child: Text(
                    Gender.female.label,
                    style: TextStyle(
                      fontSize: AppTypography.fontSizeExtraLarge,
                      fontWeight: AppTypography.fontWeightSemibold,
                      color: selectedGender == Gender.female
                          ? Colors.black
                          : Colors.white,
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
