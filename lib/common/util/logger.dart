import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // 호출 스택 깊이 (메서드 몇 개까지 표시할지)
    errorMethodCount: 8, // 에러 발생 시 출력할 스택 깊이
    lineLength: 80, // 출력 가로 길이 제한
    colors: true, // 터미널 컬러 사용
    printEmojis: true, // 이모지 추가
  ),
);