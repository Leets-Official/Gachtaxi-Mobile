import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_input_notifier.g.dart';

@riverpod
class ChatInputActionNotifier extends AutoDisposeNotifier<ActionToggleState> {
  @override
  ActionToggleState build() {
    return ActionToggleState(
      isExpanded: false,
    );
  }

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }
}

class ActionToggleState {
  final bool isExpanded;

  ActionToggleState({
    required this.isExpanded,
  });

  ActionToggleState copyWith({bool? isExpanded}) {
    return ActionToggleState(
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
