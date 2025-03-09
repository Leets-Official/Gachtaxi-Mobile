import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/manual_matching_card.dart';

class ManualMatchingCategoryScreen extends StatelessWidget {
  const ManualMatchingCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.separated(
          padding: EdgeInsets.only(bottom: AppSpacing.spaceCommon * 2.5),
          itemBuilder: (context, index) {
            return ManualMatchingCard();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: AppSpacing.spaceCommon,
            );
          },
          itemCount: 1),
    );
  }
}
