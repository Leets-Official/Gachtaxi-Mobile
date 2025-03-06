import 'package:flutter/material.dart';

class NotifierIcon extends StatelessWidget {
  const NotifierIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Color(0xFF08F283),
            )),
        Positioned(
          top: 10,
          right: 12,
          child: Container(
            width: 12,
            height: 12,
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
