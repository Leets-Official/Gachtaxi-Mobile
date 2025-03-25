import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_input_text_notifier.g.dart';

@riverpod
class ChatInputTextNotifier extends _$ChatInputTextNotifier {
  @override
  TextEditingController build() => TextEditingController();

  void submitMessage() {
    if (state.text.isNotEmpty) {
      if (state.text.isNotEmpty) {
        ref.read(chatViewModelProvider.notifier).sendMessage(state.text);

        state.clear();
      }
    }
  }
}

