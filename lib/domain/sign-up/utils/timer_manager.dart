import 'dart:async';
import 'package:flutter/material.dart';

class TimerManager with ChangeNotifier {
  bool isFirstClick = true;
  int remainingSeconds = 300;
  bool isCodeInputVisible = false;
  Timer? _timer;
  bool _isDisposed = false;

  String get formattedTime =>
      "${(remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(remainingSeconds % 60).toString().padLeft(2, '0')}";

  void startTimer() {
    if (!isFirstClick || _isDisposed) return;

    isFirstClick = false;
    isCodeInputVisible = true;
    remainingSeconds = 300;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        notifyListeners();
      } else {
        timer.cancel();
        isFirstClick = true;
        notifyListeners();
      }
    });
  }

  // 앱스택 제거로 인한 예외 발생 방지처리
  @override
  void dispose() {
    _isDisposed = true;
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
