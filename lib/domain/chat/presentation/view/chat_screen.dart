import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/chat_message_factory.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_dummy.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_input_action_notifier.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_action_bar.dart';

import '../widget/chat_input.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<ChatScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // ChatActionBar 열림/닫힘 제어용 애니메이션 컨트롤러
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 230),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 하단 네비게이션바 색/아이콘 밝기 세팅
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

    // 액션 바 열고 닫을 때 애니메이션 재생
    if (chatState.isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    // 더미 데이터
    final List<ChatMessageModel> messages = ChatDummy.generateDummyMessages();
    final int myUserId = 1;

    return Scaffold(
      body: DefaultLayout(
        hasAppBar: true,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
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
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: messages.map((message) {
                            final isMine = (message.senderId == myUserId);
                            return MessageUIFactory.getMessageWidget(
                              message: message,
                              isMine: isMine,
                              showProfile: true,
                              showTime: true,
                            );
                          }).toList(),
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
                child: ChatInputField(),
              ),
            ),

            IgnorePointer(
              ignoring: false,
              child: SizeTransition(
                sizeFactor: _animation,
                axisAlignment: 1.0,
                child: ChatActionBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
