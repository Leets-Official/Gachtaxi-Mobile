import 'dart:async';
import 'package:flutter/material.dart';

class TimerManager extends ChangeNotifier {
  int remainingTime = 300; // 5분 (초 단위)
  Timer? _timer;
  bool isCodeInputVisible = false; // ✅ 인증번호 입력 필드 표시 여부
  bool isFirstClick = true; // ✅ 처음에는 "인증번호 받기"로 표시

  void startTimer() {
    _timer?.cancel();
    remainingTime = 300;
    isCodeInputVisible = true; // ✅ 인증번호 입력 필드 표시
    isFirstClick = false; // ✅ 버튼 텍스트 변경
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    int minutes = remainingTime ~/ 60;
    int seconds = remainingTime % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
