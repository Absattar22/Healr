import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/chatbot/presentation/views/widgets/chat_bubble.dart';

class UnemptyChatBot extends StatelessWidget {
  const UnemptyChatBot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Text(
          "New Chat",
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        const CHatBubbleOthers(message: "Hi there! How can I help you today?"),
        const ChatBubble(message: "Hello! Thank you"),
        const CHatBubbleOthers(
            message: "Are you experiencing any symptoms lately?"),
        const CHatBubbleOthers(
            message:
                "How long have you been experiencing these symptoms? A few days, weeks, or longer?")
      ],
    );
  }
}
