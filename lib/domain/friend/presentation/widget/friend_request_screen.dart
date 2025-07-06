import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:gachtaxi_app/domain/friend/data/service/friend_service.dart';
import 'package:gachtaxi_app/domain/friend/presentation/state/friend_search_pagination_state.dart';
import 'package:gachtaxi_app/domain/friend/presentation/state/friend_search_state.dart';
import 'package:gachtaxi_app/domain/friend/presentation/widget/friend_search_card.dart';

class FriendRequestScreen extends ConsumerStatefulWidget {
  const FriendRequestScreen({super.key});

  @override
  ConsumerState<FriendRequestScreen> createState() =>
      _FriendRequestScreenState();
}

class _FriendRequestScreenState extends ConsumerState<FriendRequestScreen> {
  final TextEditingController controller = TextEditingController();
  late ScrollController _scrollController;
  bool _isLoading = false;
  String _currentSearchKeyword = '';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadNextPage();
    }
  }

  Future<void> _loadNextPage() async {
    final paginationState = ref.read(friendSearchPaginationStateProvider);
    if (_isLoading || paginationState.isLast || _currentSearchKeyword.isEmpty)
      return;

    setState(() {
      _isLoading = true;
    });

    try {
      final nextPage = paginationState.pageNumber + 1;
      final response = await ref
          .read(friendServiceProvider)
          .searchFriends(_currentSearchKeyword, nextPage);

      ref
          .read(friendSearchStateProvider.notifier)
          .addFriends(response.memberList);
      ref
          .read(friendSearchPaginationStateProvider.notifier)
          .setPageable(response.pageable);
    } catch (e) {
      if (mounted) {
        ToastShowUtils(context: context).showSuccess(
          '검색 결과를 불러오는데 실패했습니다.',
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

  Future<void> _searchFriends() async {
    if (controller.text.trim().isEmpty) return;

    ref.read(friendSearchStateProvider.notifier).clear();
    ref.read(friendSearchPaginationStateProvider.notifier).clear();

    _currentSearchKeyword = controller.text.trim();

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await ref
          .read(friendServiceProvider)
          .searchFriends(_currentSearchKeyword, 0);

      ref
          .read(friendSearchStateProvider.notifier)
          .addFriends(response.memberList);
      ref
          .read(friendSearchPaginationStateProvider.notifier)
          .setPageable(response.pageable);
    } catch (e) {
      if (mounted) {
        ToastShowUtils(context: context).showSuccess(
          '검색에 실패했습니다.',
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
  Widget build(BuildContext context) {
    final friendSearchState = ref.watch(friendSearchStateProvider);
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
                    onSearchIconPressed: _searchFriends,
                  ),
                  SizedBox(height: AppSpacing.spaceExtraLarge),
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount:
                          friendSearchState.length + (_isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == friendSearchState.length) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.spaceCommon),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ),
                          );
                        }

                        return FriendSearchCard(
                          friend: friendSearchState[index],
                          onAddButtonTap: () {
                            ref.read(friendServiceProvider).requestFriend(
                                friendSearchState[index].nickname);
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
