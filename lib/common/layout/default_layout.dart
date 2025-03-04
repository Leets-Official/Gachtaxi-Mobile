import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';

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
    return Scaffold(
      backgroundColor: AppColors.neutralDark,
      appBar: renderAppBar(context),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar(BuildContext context) {
    if (!hasAppBar) return null;
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: AppColors.neutralDark,
      foregroundColor: AppColors.white,
      elevation: 0,
    );
  }
}
