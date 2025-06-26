import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:healr/core/errors/failure.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/chatbot/data/chatbot_repo.dart';
import 'package:healr/features/chatbot/models/chat_bot_response/chat_bot_response.dart';
import 'package:http/http.dart' as http;

class ChatbotRepoImp implements ChatbotRepo {
  String responseText = '';

  ChatbotRepoImp(ApiService apiService);
  @override
  Future<Either<Failure, ChatBotResponse>> sendSymptoms(String symptoms) async {
    final url = Uri.parse('https://openrouter.ai/api/v1/chat/completions');
    final headers = {
      'Authorization':
          'Bearer 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',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      "model": "qwen/qwen-2.5-7b-instruct",
      "messages": [
        {"role": "user", "content": symptoms}
      ]
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final chatBotResponse = ChatBotResponse.fromJson(data);
        return Right(chatBotResponse);
      } else {
        return Left(
            ServerFailure('❌ خطأ في الاتصال بالسيرفر: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(ServerFailure('❌ حدث خطأ غير متوقع: $e'));
    }
  }
}
