import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/home/model/auto-matching/auto_matching_request_model.dart';
import 'package:gachtaxi_app/domain/home/services/auto_matching_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_matching_provider.g.dart';

@riverpod
class AutoMatching extends _$AutoMatching {
  @override
  AsyncValue<ApiResponse?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> requestAutoMatching(AutoMatchingRequest request) async {
    state = const AsyncLoading();
    final service = ref.read(autoMatchingServiceProvider);

    try {
      final res = await service.requestAutoMatching(request);
      state = AsyncData(res.data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
    // final dummy = ApiResponse(
    //   data: {
    //     "autoMatchingStatus": "string",
    //   },
    //   message: '하이',
    //   code: 200,
    // );

    // try {
    //   await Future.delayed(const Duration(seconds: 1));

    //   debugPrint('$dummy');
    //   state = AsyncData(dummy);
    // } catch (e, st) {
    //   state = AsyncError(e, st);
    // }
  }
}
