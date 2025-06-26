class Usage {
	int? promptTokens;
	int? completionTokens;
	int? totalTokens;

	Usage({this.promptTokens, this.completionTokens, this.totalTokens});

	factory Usage.fromJson(Map<String, dynamic> json) => Usage(
				promptTokens: json['prompt_tokens'] as int?,
				completionTokens: json['completion_tokens'] as int?,
				totalTokens: json['total_tokens'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'prompt_tokens': promptTokens,
				'completion_tokens': completionTokens,
				'total_tokens': totalTokens,
			};
}
