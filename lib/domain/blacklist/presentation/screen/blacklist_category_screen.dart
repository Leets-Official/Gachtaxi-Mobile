import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:gachtaxi_app/domain/blacklist/data/service/blacklist_service.dart';
import 'package:gachtaxi_app/domain/blacklist/presentation/state/blacklist_list_pagination_state.dart';
import 'package:gachtaxi_app/domain/blacklist/presentation/state/blacklists_list_state.dart';
import 'package:gachtaxi_app/domain/blacklist/presentation/widget/blacklist_card.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';

class BlacklistCategoryScreen extends ConsumerStatefulWidget {
  final bool isBlacklist;
  const BlacklistCategoryScreen({super.key, required this.isBlacklist});

  @override
  ConsumerState<BlacklistCategoryScreen> createState() =>
      _BlacklistCategoryScreenState();
}

class _BlacklistCategoryScreenState
    extends ConsumerState<BlacklistCategoryScreen> {
  late ScrollController _scrollController;
  bool _isLoading = false;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    final blacklistList = ref.read(blacklistsListStateProvider);
    if (blacklistList.isEmpty) {
      ref.read(blacklistServiceProvider).getBlacklists(0).then((value) {
        ref
            .read(blacklistsListStateProvider.notifier)
            .addAllBlacklist(value.blacklist);
        ref.read(blacklistListPaginationStateProvider.notifier).setPageable(
              value.pageable,
            );
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
    final paginationState = ref.read(blacklistListPaginationStateProvider);
    if (_isLoading || paginationState.isLast) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final nextPage = paginationState.pageNumber + 1;
      final response =
          await ref.read(blacklistServiceProvider).getBlacklists(nextPage);

      ref
          .read(blacklistsListStateProvider.notifier)
          .addAllBlacklist(response.blacklist);

      ref.read(blacklistListPaginationStateProvider.notifier).setPageable(
            response.pageable,
          );
    } catch (e) {
      if (mounted) {
        ToastShowUtils(context: context).showSuccess(
          '블랙리스트를 불러오는데 실패했습니다.',
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
  void didUpdateWidget(covariant BlacklistCategoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isBlacklist != widget.isBlacklist) {
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
    final blacklistListData = ref.watch(blacklistsListStateProvider);
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.minHeight * 1.3;

    return SizedBox(
      width: double.infinity,
      height: isExpanded
          ? MediaQuery.of(context).size.height * 0.7
          : MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          InputField(
            hintText: '닉네임 입력하기',
            controller: _controller,
            labelFontSize: AppTypography.fontSizeMedium,
            hasSearchIcon: true,
            onSearchIconPressed: () {
              // TODO: 블랙리스트 검색 API가 존재하지 않음
            },
          ),
          const SizedBox(height: AppSpacing.spaceExtraLarge),
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.only(bottom: AppSpacing.spaceCommon * 2.5),
              itemBuilder: (context, index) {
                if (index == blacklistListData.length) {
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

                final blacklist = blacklistListData[index];
                return BlacklistCard(
                  blacklist: blacklist,
                  onDeleteTap: () =>
                      _onBlacklistDeleteTap(blacklist.receiverId),
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.spaceCommon),
              itemCount: blacklistListData.length + (_isLoading ? 1 : 0),
            ),
          ),
        ],
      ),
    );
  }

  void _onBlacklistDeleteTap(int receiverId) {
    ref
        .read(blacklistServiceProvider)
        .deleteBlacklist(receiverId)
        .then((value) {
      ref
          .read(blacklistsListStateProvider.notifier)
          .removeBlacklist(receiverId);
    });
    ToastShowUtils(context: context).showSuccess(
      '블랙리스트에서 해제했어요',
    );
  }
}
