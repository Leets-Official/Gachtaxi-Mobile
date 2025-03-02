import 'package:flutter/material.dart';
import 'package:gachtaxi_app/home/view/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
      ),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
