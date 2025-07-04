import 'user_review.dart';

class GetAllReviewsModel {
  String? status;
  int? numberOfDocuments;
  List<UserReview>? data;

  GetAllReviewsModel({this.status, this.numberOfDocuments, this.data});

  factory GetAllReviewsModel.fromJson(Map<String, dynamic> json) {
    return GetAllReviewsModel(
      status: json['Status'] as String?,
      numberOfDocuments: json['Number of documents'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserReview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Number of documents': numberOfDocuments,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
