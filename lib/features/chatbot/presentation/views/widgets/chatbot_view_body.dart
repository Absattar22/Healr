import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/features/chatbot/presentation/views/widgets/empty_chatbot.dart';
import 'package:healr/features/chatbot/presentation/views/widgets/send_message.dart';
import 'package:healr/features/chatbot/presentation/views/widgets/unempty_chatbot.dart';

class ChatbotViewBody extends StatelessWidget {
  const ChatbotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  child: EmptyChatBot(),
                ),
              ),
              const SendMessage(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
