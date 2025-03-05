import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatInputNotifier extends StateNotifier<TextEditingController> {
  ChatInputNotifier() : super(TextEditingController());

  void submitMessage() {
    if (state.text.isNotEmpty) {
      /*
      todo: API 연결
       */
      state.clear();
    }
  }
}

final chatInputProvider = StateNotifierProvider<ChatInputNotifier, TextEditingController>(
  (ref) => ChatInputNotifier(),
);