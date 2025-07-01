import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:gachtaxi_app/domain/friend/data/service/friend_service.dart';
import 'package:gachtaxi_app/domain/friend/presentation/state/friend_search_state.dart';
import 'package:gachtaxi_app/domain/friend/presentation/widget/friend_search_card.dart';

class FriendRequestScreen extends ConsumerWidget {
  final TextEditingController controller = TextEditingController();
  FriendRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendSearchState = ref.watch(friendSearchStateProvider);
    print(friendSearchState);
    return DefaultLayout(
      hasAppBar: true,
      title: '친구 요청',
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.spaceCommon),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.spaceExtraLarge),
                  InputField(
                    hintText: '닉네임 입력하기',
                    controller: controller,
                    label: '친구 닉네임',
                    labelFontSize: AppTypography.fontSizeMedium,
                    hasSearchIcon: true,
                    onSearchIconPressed: () {
                      ref
                          .read(friendServiceProvider)
                          .searchFriends(
                            controller.text,
                            ref
                                .read(friendSearchStateProvider.notifier)
                                .getCurrentPageNum(),
                          )
                          .then((value) {
                        ref
                            .read(friendSearchStateProvider.notifier)
                            .addFriends(value);
                      });
                    },
                  ),
                  SizedBox(height: AppSpacing.spaceExtraLarge),
                  Expanded(
                    child: ListView.builder(
                      itemCount: friendSearchState.length,
                      itemBuilder: (context, index) {
                        return FriendSearchCard(
                          friend: ref.watch(friendSearchStateProvider)[index],
                          onAddButtonTap: () {
                            ref.read(friendServiceProvider).requestFriend(ref
                                .watch(friendSearchStateProvider)[index]
                                .nickname);
                            ToastShowUtils(context: context).showSuccess(
                              '친구요청이 전송되었어요',
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
