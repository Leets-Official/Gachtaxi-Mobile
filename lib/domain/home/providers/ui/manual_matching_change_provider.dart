import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manual_matching_change_provider.g.dart';

@riverpod
class ManualMatchingChangeNotifier extends _$ManualMatchingChangeNotifier {
  @override
  MatchingCategory build() {
    return MatchingCategory.manual;
  }

  void toggleCategory() {
    state = state == MatchingCategory.manual
        ? MatchingCategory.my
        : MatchingCategory.manual;
  }
}
