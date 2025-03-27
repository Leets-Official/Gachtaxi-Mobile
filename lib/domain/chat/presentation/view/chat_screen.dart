import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_input_action_notifier.dart';
import 'package:gachtaxi_app/domain/chat/presentation/view_model/chat_view_model.dart';
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

    // ChatActionBar 열림/닫힘 제어용 애니메이션 컨트롤러
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 230),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final notifier = ref.read(chatViewModelProvider.notifier);
      await notifier.connectWebSocket(roomId: widget.roomId);
      await notifier.fetchMemberCount(roomId: widget.roomId);
      await notifier.loadInitialMessages(widget.roomId);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.chatInputField,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    final chatActionState = ref.watch(chatInputActionNotifierProvider);
    final chatActionNotifier = ref.read(chatInputActionNotifierProvider.notifier);
    final chatViewModel = ref.watch(chatViewModelProvider);
    final chatViewModelNotifier = ref.read(chatViewModelProvider.notifier);

    if (chatActionState.isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    const int myUserId = 1;
    final messages = chatViewModel.messageState.messages;

    final messageWidgets = chatViewModelNotifier.buildMessageList(
      messages: messages,
      disconnectedAt: chatViewModel.uiState.disconnectedAt,
      showNewMessagesIndicator: chatViewModel.uiState.showNewMessagesIndicator,
      myUserId: myUserId,
    );

    return Scaffold(
      appBar: renderAppBar(context, chatViewModel.metaState.memberCount),
      backgroundColor: AppColors.neutralDark,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _focusNode.unfocus();
                    if (chatActionState.isExpanded) {
                      chatActionNotifier.toggleExpanded();
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return NotificationListener<ScrollNotification>(
                        onNotification: (scrollInfo) {
                          if (scrollInfo is ScrollEndNotification) {
                            final metrics = scrollInfo.metrics;
                            if (metrics.pixels >=
                                metrics.maxScrollExtent - 10) {
                              ref.read(chatViewModelProvider.notifier).loadMoreMessages(widget.roomId);
                            }
                          }
                          return false;
                        },
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: messageWidgets,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                color: AppColors.neutralComponent,
                child: SafeArea(
                  child: ChatInputField(focusNode: _focusNode),
                ),
              ),
              AbsorbPointer(
                absorbing: !chatActionState.isExpanded,
                child: SizeTransition(
                  sizeFactor: _animation,
                  axisAlignment: 1.0,
                  child: ChatActionBar(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar? renderAppBar(BuildContext context, int memberCount) {
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
            builder: (context) {
              return ChatMember();
            },
          );
        },
      ),
    ],
  );
}
