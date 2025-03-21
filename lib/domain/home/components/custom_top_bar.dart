import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/home/shared/notifier_icon.dart';
import 'package:gachtaxi_app/domain/my-page/view/my_page_screen.dart';

class CustomTopBar extends ConsumerWidget {
  const CustomTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.neutralDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(SlidePageRoute(screen: MyPageScreen()));
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/profile_on_icon.svg',
                  width: 32,
                  height: 32,
                ),
                SizedBox(width: 15),
                Text(
                  '닉네임',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          NotifierIcon(),
        ],
      ),
    );
  }
}
