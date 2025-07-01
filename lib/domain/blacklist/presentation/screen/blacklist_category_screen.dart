import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/domain/blacklist/data/service/blacklist_service.dart';
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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    final pageNum =
        ref.read(blacklistsListStateProvider.notifier).getCurrentPageNum();
    if (pageNum == 0) {
      ref.read(blacklistServiceProvider).getBlacklists(pageNum).then((value) {
        ref.read(blacklistsListStateProvider.notifier).addAllBlacklist(value);
      });
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
    super.dispose();
    _scrollController.dispose();
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
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.only(bottom: AppSpacing.spaceCommon * 2.5),
        itemBuilder: (context, index) {
          final blacklist = blacklistListData[index];
          return BlacklistCard(
            blacklist: blacklist,
            onDeleteTap: () => _onBlacklistDeleteTap(blacklist.receiverId),
          );
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSpacing.spaceCommon),
        itemCount: blacklistListData.length,
      ),
    );
  }

  void _onBlacklistDeleteTap(int receiverId) {
    // TODO: 블랙리스트 삭제 로직
  }
}
