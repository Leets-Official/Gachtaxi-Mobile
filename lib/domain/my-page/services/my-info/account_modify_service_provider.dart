import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/my-page/services/my-info/account_modify_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_modify_service_provider.g.dart';

@riverpod
AccountModifyService accountModifyService(Ref ref) {
  return AccountModifyService();
}
