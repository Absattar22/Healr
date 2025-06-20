class ForgetPassModel {
  final String status;
  final String message;

  ForgetPassModel({
    required this.status,
    required this.message,
  });
  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'Message': message,
    };
  }

  factory ForgetPassModel.fromJson(Map<String, dynamic> json) {
    return ForgetPassModel(
      status: json['Status'] ?? json['status'] ?? '',
      message: json['Message'] ?? json['message'] ?? '',
    );
  }
}
