import 'choice.dart';
import 'usage.dart';

class ChatBotResponse {
  String? id;
  String? provider;
  String? model;
  String? object;
  int? created;
  List<Choice>? choices;
  Usage? usage;
  String? sentAt;

  ChatBotResponse({
    this.id,
    this.provider,
    this.model,
    this.object,
    this.created,
    this.choices,
    this.usage,
    this.sentAt,
  });

  factory ChatBotResponse.fromJson(Map<String, dynamic> json) {
    return ChatBotResponse(
      id: json['id'] as String?,
      provider: json['provider'] as String?,
      model: json['model'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'provider': provider,
        'model': model,
        'object': object,
        'created': created,
        'choices': choices?.map((e) => e.toJson()).toList(),
        'usage': usage?.toJson(),
      };
}
