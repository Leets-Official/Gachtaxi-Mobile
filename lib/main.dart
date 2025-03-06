import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/home/view/home_screen.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
