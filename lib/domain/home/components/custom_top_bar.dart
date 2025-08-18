import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/chat/presentation/view/chat_screen.dart';
import 'package:gachtaxi_app/domain/home/providers/response/auto_matching_status_provider.dart';
import 'package:gachtaxi_app/domain/home/shared/notifier_icon.dart';

class CustomTopBar extends ConsumerWidget {
  const CustomTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchingStatusState = ref.watch(autoMatchingStatusNotifierProvider);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.neutralDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/profile_on_icon.svg',
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 15),
              matchingStatusState.when(
                data: (res) {
                  if (res.data != null && res.data!.isFound == true) {
                    return TextButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            SlidePageRoute(
                                screen: ChatScreen(
                                    roomId: res.data!.roomId!,
                                    category: MatchingCategory.auto,
                                    matchingRoomId:
                                        res.data!.chattingRoomId!)));
                        // ignore: unused_result
                        await ref
                            // ignore: unused_result
                            .refresh(autoMatchingStatusNotifierProvider.future);
                      },
                      child: const Text("현재 매칭중인 채팅방 입장하기"),
                    );
                  } else {
                    return const Text(
                      '닉네임',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    );
                  }
                },
                loading: () => const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: Colors.white),
                ),
                error: (err, st) => const Text(
                  '닉네임',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          NotifierIcon(),
        ],
      ),
    );
  }
}
