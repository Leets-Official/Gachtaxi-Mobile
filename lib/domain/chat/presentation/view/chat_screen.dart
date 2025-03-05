import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_new_message.dart';

import '../widget/chat_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.chatInputField,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Text(
                        "여기에 채팅 메시지가 들어갑니다.",
                        style: TextStyle(color: Colors.white54),
                      ),
                      const NewMessagesIndicator(),
                    ],
                  ),
                ),
              ),

              Container(
                color: AppColors.chatInputField,
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
