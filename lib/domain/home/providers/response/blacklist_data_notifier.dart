import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/home/model/blacklist/blacklist_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blacklist_data_notifier.g.dart';

@riverpod
class BlacklistDataNotifier extends _$BlacklistDataNotifier {
  @override
  Future<BlacklistResponse> build() async {
    return BlacklistResponse(
        blacklist: [],
        pageable: Pageable(
            pageNumber: 0, pageSize: 0, numberOfElements: 0, isLast: false));
  }
}
