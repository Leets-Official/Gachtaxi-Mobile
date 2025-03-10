import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/chat_message_factory.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_dummy.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

import '../widget/chat_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.chatInputField,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    });

    // 더미데이터
    final List<ChatMessageModel> messages = ChatDummy.generateDummyMessages();
    final int myUserId = 1;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },

        child: DefaultLayout(
          hasAppBar: true,

          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isMine = (message.senderId == myUserId);
                      final showProfile = true;
                      final showTime = true;
                      return MessageUIFactory.getMessageWidget(
                        message: message,
                        isMine: isMine,
                        showProfile: showProfile,
                        showTime: showTime,
                      );
                    },
                  ),
                ),
              ),

              Container(
                color: AppColors.neutralComponent,
                child: SafeArea(
                  child: const ChatInputField(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
