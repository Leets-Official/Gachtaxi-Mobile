import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_input_action_notifier.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_view_model.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_action_bar.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_member.dart';
import '../widget/chat_input.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final int roomId;
  const ChatScreen({super.key, required this.roomId});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<ChatScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final ScrollController _scrollController = ScrollController();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // 액션바 열림/닫힘 애니메이션
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 230),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // 위로 스크롤 시 예전 메시지 로딩
    _scrollController.addListener(_onScroll);

    Future.microtask(() {
      final chatVM = ref.read(chatViewModelProvider.notifier);
      chatVM.loadMessages(widget.roomId);
      chatVM.connectWebSocket(widget.roomId);
      chatVM.fetchMemberCount(widget.roomId);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    // 1) 스크롤 방향이 '위로'(forward)인지 확인
    if (_scrollController.position.userScrollDirection != ScrollDirection.reverse) {
      return;
    }

    // 2) 상단 100px 근접했을 때 로드
    if (_scrollController.position.pixels <= 100) {
      final chatVM = ref.read(chatViewModelProvider.notifier);
      final oldOffset = _scrollController.offset;
      final oldMaxExtent = _scrollController.position.maxScrollExtent;

      chatVM.loadMoreMessages(
        widget.roomId,
        oldOffset: oldOffset,
        oldMaxExtent: oldMaxExtent,
        onScrolled: (diff) {
          _scrollController.jumpTo(oldOffset + diff);
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.chatInputField,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });

    final chatState = ref.watch(chatInputActionNotifierProvider);
    final chatNotifier = ref.read(chatInputActionNotifierProvider.notifier);

    // ViewModel
    final chatVM = ref.watch(chatViewModelProvider.notifier);
    final renderMessages = chatVM.renderMessages;

    // memberCount 등 상태는 이렇게도 가져올 수 있음
    final state = ref.watch(chatViewModelProvider);

    // 액션바 열림/닫힘
    if (chatState.isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    return Scaffold(
      appBar: _buildAppBar(state.memberCount),
      backgroundColor: AppColors.neutralDark,
      body: Stack(
        children: [
          Column(
            children: [
              // 메시지 영역
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _focusNode.unfocus();
                    if (chatState.isExpanded) {
                      chatNotifier.toggleExpanded();
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: renderMessages,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // 입력창
              Container(
                color: AppColors.neutralComponent,
                child: SafeArea(
                  child: ChatInputField(focusNode: _focusNode),
                ),
              ),
              // 액션 바
              AbsorbPointer(
                absorbing: !chatState.isExpanded,
                child: SizeTransition(
                  sizeFactor: _animation,
                  axisAlignment: 1.0,
                  child: const ChatActionBar(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(int memberCount) {
    return AppBar(
      backgroundColor: AppColors.neutralDark,
      foregroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      title: Row(
        children: [
          SizedBox(width: 16.w),
          Text(
            "채팅방",
            style: TextStyle(
              fontSize: AppTypography.fontSizeExtraLarge.sp,
              fontWeight: AppTypography.fontWeightSemibold,
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            "$memberCount",
            style: TextStyle(
              fontSize: AppTypography.fontSizeMedium.sp,
              fontWeight: AppTypography.fontWeightMedium,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            showDialog(
              context: context,
              barrierColor: Colors.transparent,
              builder: (context) => const ChatMember(),
            );
          },
        ),
      ],
    );
  }
}
