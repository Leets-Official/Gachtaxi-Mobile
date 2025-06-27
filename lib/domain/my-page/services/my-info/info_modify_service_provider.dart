import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/my-page/services/my-info/info_modify_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'info_modify_service_provider.g.dart';

@riverpod
InfoModifyService infoModifyService(Ref ref) {
  return InfoModifyService();
}
