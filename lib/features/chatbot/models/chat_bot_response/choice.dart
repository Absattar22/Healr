import 'message.dart';

class Choice {
	dynamic logprobs;
	String? finishReason;
	String? nativeFinishReason;
	int? index;
	Message? message;

	Choice({
		this.logprobs, 
		this.finishReason, 
		this.nativeFinishReason, 
		this.index, 
		this.message, 
	});

	factory Choice.fromJson(Map<String, dynamic> json) => Choice(
				logprobs: json['logprobs'] as dynamic,
				finishReason: json['finish_reason'] as String?,
				nativeFinishReason: json['native_finish_reason'] as String?,
				index: json['index'] as int?,
				message: json['message'] == null
						? null
						: Message.fromJson(json['message'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'logprobs': logprobs,
				'finish_reason': finishReason,
				'native_finish_reason': nativeFinishReason,
				'index': index,
				'message': message?.toJson(),
			};
}
