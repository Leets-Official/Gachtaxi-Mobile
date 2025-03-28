import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotifierIcon extends StatelessWidget {
  const NotifierIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/notification_icon.svg',
              width: 20,
              height: 24,
            )),
        Positioned(
          top: 10,
          right: 12,
          child: Container(
            width: 10,
            height: 10,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFFF3636),
            ),
          ),
        ),
      ],
    );
  }
}
