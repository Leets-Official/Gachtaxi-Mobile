import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/friend/data/service/friend_service.dart';
import 'package:gachtaxi_app/domain/friend/presentation/state/friend_list_pagination_state.dart';
import 'package:gachtaxi_app/domain/friend/presentation/state/friends_list_state.dart';
import 'package:gachtaxi_app/domain/friend/presentation/widget/friend_card.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';

class FriendCategoryScreen extends ConsumerStatefulWidget {
  final bool isFriend;

  const FriendCategoryScreen({super.key, required this.isFriend});

  @override
  ConsumerState<FriendCategoryScreen> createState() =>
      _FriendCategoryScreenState();
}

class _FriendCategoryScreenState extends ConsumerState<FriendCategoryScreen> {
  late ScrollController _scrollController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(_scrollListener);

    final friendList = ref.read(friendsListStateProvider);
    if (friendList.isEmpty) {
      ref.read(friendServiceProvider).getFriends(0).then((value) {
        ref.read(friendsListStateProvider.notifier).addFriends(value.response);
        ref
            .read(friendListPaginationStateProvider.notifier)
            .setPageable(value.pageable);
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200.h) {
      _loadNextPage();
    }
  }

  Future<void> _loadNextPage() async {
    final paginationState = ref.read(friendListPaginationStateProvider);
    if (_isLoading || paginationState.isLast) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final nextPage = paginationState.pageNumber + 1;
      final response =
          await ref.read(friendServiceProvider).getFriends(nextPage);

      ref.read(friendsListStateProvider.notifier).addFriends(response.response);

      ref
          .read(friendListPaginationStateProvider.notifier)
          .setPageable(response.pageable);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('친구 목록을 불러오는데 실패했습니다.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant FriendCategoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isFriend != widget.isFriend) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final friendListData = ref.watch(friendsListStateProvider);
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.minHeight * 1.3;

    return SizedBox(
      width: double.infinity,
      height: isExpanded
          ? MediaQuery.of(context).size.height * 0.7
          : MediaQuery.of(context).size.height * 0.25,
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.only(bottom: AppSpacing.spaceCommon * 2.5),
        itemBuilder: (context, index) {
          if (index == friendListData.length) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppSpacing.spaceCommon),
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            );
          }

          final friend = friendListData[index];
          return FriendCard(
            friend: friend,
            onAdditionalTap: () => _onFriendAdditionalTap(friend.friendsId),
          );
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSpacing.spaceCommon),
        itemCount: friendListData.length + (_isLoading ? 1 : 0),
      ),
    );
  }

  void _onFriendAdditionalTap(int friendId) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 353.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: AppColors.neutralComponent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              AppSpacing.spaceCommon,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.spaceCommon),
                const Text(
                  '친구를 삭제할까요?',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppTypography.fontSizeExtraLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceExtraLarge),
                const Text(
                  '친구를 삭제하거나 블랙리스트로 이동할 수 있어요',
                  style: TextStyle(
                    color: AppColors.darkGray,
                    fontSize: AppTypography.fontSizeSmall,
                  ),
                ),
                const Spacer(),
                Button(
                  buttonText: '친구 삭제',
                ),
                const SizedBox(height: AppSpacing.spaceCommon),
                Button(
                  buttonText: '블랙리스트',
                  backgroundColor: AppColors.neutralComponent,
                  borderColor: AppColors.primary,
                  textColor: AppColors.primary,
                ),
                const SizedBox(height: AppSpacing.spaceCommon),
              ],
            ),
          ),
        );
      },
    );
  }
}
