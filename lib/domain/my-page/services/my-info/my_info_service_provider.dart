import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/my-page/services/my-info/my_info_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_info_service_provider.g.dart';

@riverpod
MyInfoService myInfoService(Ref ref) {
  return MyInfoService();
}
