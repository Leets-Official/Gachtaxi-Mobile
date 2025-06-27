import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final bool hasAppBar;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const DefaultLayout({
    required this.child,
    this.title,
    this.hasAppBar = false,
    this.bottomNavigationBar,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.neutralDark,
        appBar: renderAppBar(context),
        body: child,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  AppBar? renderAppBar(BuildContext context) {
    if (!hasAppBar) return null;
    return AppBar(
      toolbarHeight: 80.h,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      titleSpacing: 0,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Text(
            title ?? '',
            style: TextStyle(
              fontSize: AppTypography.fontSizeExtraLarge.sp,
              fontWeight: AppTypography.fontWeightSemibold,
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.neutralDark,
      foregroundColor: AppColors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }
}
