import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/sign-up/view/sign_up_screen.dart';

class TermsAgreementModal extends StatefulWidget {
  const TermsAgreementModal({Key? key}) : super(key: key);

  @override
  State<TermsAgreementModal> createState() => _TermsAgreementModalState();
}

class _TermsAgreementModalState extends State<TermsAgreementModal> {
  bool allChecked = false;
  bool termsChecked = false;
  bool privacyChecked = false;

  void _updateCheckbox(bool? value, String type) {
    setState(() {
      if (type == "all") {
        allChecked = value ?? false;
        termsChecked = allChecked;
        privacyChecked = allChecked;
      } else if (type == "terms") {
        termsChecked = value ?? false;
      } else if (type == "privacy") {
        privacyChecked = value ?? false;
      }

      allChecked = termsChecked && privacyChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "가치 택시에 오신 것을\n환영합니다!",
          style: TextStyle(
            fontSize: AppTypography.fontSizeExtraLarge,
            fontWeight: AppTypography.fontWeightBold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.spaceLarge),

        _buildCheckboxTile(
          "약관 모두 동의",
          allChecked,
              (value) => _updateCheckbox(value, "all"),
          isBold: true,
          isAllAgreement: true,
        ),
        const SizedBox(height: AppSpacing.spaceMedium),

        _buildCheckboxTile(
          "이용 약관 동의 (필수)",
          termsChecked,
              (value) => _updateCheckbox(value, "terms"),
        ),
        _buildCheckboxTile(
          "개인정보 수집 및 이용 동의 (필수)",
          privacyChecked,
              (value) => _updateCheckbox(value, "privacy"),
        ),
        const SizedBox(height: AppSpacing.spaceExtraCommon),

        Button(
          buttonText: "시작하기",
          backgroundColor: allChecked ? AppColors.primary : Colors.grey,
          textColor: Colors.black,
          onPressed: allChecked
              ? () {
            Navigator.pop(context);
            Navigator.push(
              context,
              SlidePageRoute(screen: SignUpScreen()),
            );
          }
              : null,
        ),
      ],
    );
  }

  Widget _buildCheckboxTile(
      String title,
      bool value,
      Function(bool?) onChanged, {
        bool isBold = false,
        bool isAllAgreement = false,
      }) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: isAllAgreement
          ? Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.SpaceExtraExtraMedium,
          horizontal: AppSpacing.spaceCommon,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.spaceExtraLarge),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: Row(
          children: [
            Icon(
              value ? Icons.circle : Icons.circle_outlined,
              color: AppColors.primary,
              size: 24,
            ),
            const SizedBox(width: AppSpacing.spaceSmall),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: AppTypography.fontWeightSemibold,
                fontSize: AppTypography.fontSizeMedium,
              ),
            ),
          ],
        ),
      )
          : Container(
        width: double.infinity,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          visualDensity: VisualDensity.compact,
          leading: GestureDetector(
            onTap: () => onChanged(!value),
            child: Icon(
              value ? Icons.circle : Icons.circle_outlined,
              color: value ? AppColors.primary : AppColors.lightGray,
              size: AppSpacing.spaceLarge,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: AppColors.lightGray,
              fontWeight: AppTypography.fontWeightMedium,
              fontSize: AppTypography.fontSizeSmall,
            ),
          ),
          trailing: SvgPicture.asset(
            'assets/icons/modal_next_icon.svg',
            width: AppSpacing.spaceExtraCommon,
            height: AppSpacing.spaceExtraCommon,
          ),
          onTap: () => onChanged(!value),
        ),
      ),
    );
  }
}
