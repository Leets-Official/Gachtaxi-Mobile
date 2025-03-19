import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_input_text_notifier.g.dart';

@riverpod
class ChatInputTextNotifier extends _$ChatInputTextNotifier {
  @override
  TextEditingController build() => TextEditingController();

  void submitMessage() {
    if (state.text.isNotEmpty) {
      // TODO: API 연결
      state.clear();
    }
  }
}

