import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:gachtaxi_app/domain/chat/presentation/view/chat_screen.dart';
import 'package:gachtaxi_app/domain/home/model/auto-matching/auto_matching_request_model.dart';
import 'package:gachtaxi_app/domain/home/providers/request/auto_matching_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/response/auto_matching_status_provider.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/matching_setting_provider.dart';
import 'package:gachtaxi_app/domain/home/services/get_current_location_service_provider.dart';
import 'package:lottie/lottie.dart';

class MatchingWaitingScreen extends ConsumerStatefulWidget {
  const MatchingWaitingScreen({super.key});

  @override
  ConsumerState<MatchingWaitingScreen> createState() =>
      _MatchingWaitingScreenState();
}

class _MatchingWaitingScreenState extends ConsumerState<MatchingWaitingScreen> {
  late final ProviderSubscription _subscription;
  bool _isMatchingComplete = false;

  @override
  void initState() {
    super.initState();

    _subscription = ref.listenManual<AsyncValue<ApiResponse?>>(
      autoMatchingProvider,
      (prev, next) async {
        if (next is AsyncData && next.value != null) {
          if (mounted) {
            setState(() {
              _isMatchingComplete = true;
            });

            await Future.delayed(const Duration(milliseconds: 1000));
            try {
              final freshStatus =
                  await ref.refresh(autoMatchingStatusNotifierProvider.future);
              final matchingData = freshStatus.data;

              if (matchingData != null && mounted) {
                Navigator.of(context).pushReplacement(
                  SlidePageRoute(
                    screen: ChatScreen(
                      roomId: matchingData.roomId!,
                      category: MatchingCategory.auto,
                      matchingRoomId: matchingData.chattingRoomId!,
                    ),
                  ),
                );
              } else {
                if (mounted) {
                  ToastShowUtils(context: context)
                      .showSuccess('매칭 정보를 가져오지 못했어요.');
                  Navigator.of(context).pop();
                }
              }
            } catch (e) {
              if (mounted) {
                ToastShowUtils(context: context)
                    .showSuccess('매칭 상태 확인에 실패했어요.');
                Navigator.of(context).pop();
              }
            }
          }
        } else if (next is AsyncError) {
          ToastShowUtils(context: context).showSuccess('자동매칭 요청에 실패했어요.');
          Navigator.of(context).pop();
        }
      },
    );

    _startAutoMatching();
  }

  Future<void> _startAutoMatching() async {
    final matchingState = ref.read(matchingSettingNotifierProvider);
    final locationService = ref.read(getCurrentLocationServiceProvider);
    final autoMatchingService = ref.read(autoMatchingProvider.notifier);

    final currentPosition = await locationService.getCurrentLocation();
    final startLngLat =
        '${currentPosition.longitude}, ${currentPosition.latitude}';

    final destination = matchingState.destination;
    final destiLngLat = '${destination.longitude}, ${destination.latitude}';

    final requestBody = AutoMatchingRequest(
      startPoint: startLngLat,
      destinationPoint: destiLngLat,
      criteria: matchingState.selectedTags.toList(),
      members: matchingState.selectedFriends.toList(),
      expectedTotalCharge: 4000,
      destinationName: destination.name,
      departure: null,
      destination: null,
      startName: matchingState.departure.name,
    );

    await autoMatchingService.requestAutoMatching(requestBody);
  }

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: _buildLoadingScreen(),
    );
  }

  Widget _buildLoadingScreen() {
    return DefaultLayout(
      hasAppBar: false,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isMatchingComplete ? '매칭이 완료되었어요!' : '가치 탈 인원을\n 찾는 중이에요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeExtraLarge,
                    fontWeight: AppTypography.fontWeightSemibold,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceMedium),
              ],
            ),
            Lottie.asset(
              'assets/images/taxi_loading.json',
              width: double.infinity,
              height: 320,
            ),
          ],
        ),
      ),
    );
  }
}
