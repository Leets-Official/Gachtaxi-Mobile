import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manual_matching_change_provider.g.dart';

@riverpod
class ManualMatchingChangeNotifier extends _$ManualMatchingChangeNotifier {
  @override
  String build() {
    return 'manual_matching';
  }

  void toggleCategory() {
    state = state == 'manual_matching' ? 'my_matching' : 'manual_matching';
  }
}
