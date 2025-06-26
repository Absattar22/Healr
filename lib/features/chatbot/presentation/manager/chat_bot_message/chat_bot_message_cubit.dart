import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healr/features/chatbot/data/chatbot_repo.dart';
import 'package:healr/features/chatbot/models/chat_bot_response/chat_bot_response.dart';
import 'package:healr/features/chatbot/models/chat_bot_response/choice.dart';
import 'package:healr/features/chatbot/models/chat_bot_response/message.dart';

part 'chat_bot_message_state.dart';

class ChatBotMessageCubit extends Cubit<ChatBotMessageState> {
  ChatBotMessageCubit(this.chatbotRepo) : super(ChatBotMessageInitial());
  final ChatbotRepo chatbotRepo;
  final List<ChatBotResponse> messages = [];
  Future<void> sendMessage(String message) async {
    messages.add(ChatBotResponse(
        id: "user",
        choices: [Choice(message: Message(content: message))],
        sentAt: DateTime.now().toIso8601String()));
    emit(ChatBotMessageLoading());

    var result = await chatbotRepo.sendSymptoms(message);
    result.fold(
      (failure) {
        emit(ChatBotMessageFailure(failure.errMessage));
      },
      (user) {
        messages.add(ChatBotResponse(
            id: "bot",
            choices: [
              Choice(
                message: Message(
                  content: user.choices![0].message!.content!,
                ),
              ),
            ],
            sentAt: DateTime.now().toIso8601String()));
        messages.sort((a, b) => a.sentAt!.compareTo(b.sentAt!));

        emit(ChatBotMessageSuccess(messages));
      },
    );
  }
}
