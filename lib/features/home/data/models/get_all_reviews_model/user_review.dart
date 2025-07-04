class UserReview {
  String? userImage;
  String? id;
  String? userId;
  String? userName;
  String? doctorId;
  String? reviewText;
  int? rating;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  UserReview({
    this.userImage,
    this.id,
    this.userId,
    this.userName,
    this.doctorId,
    this.reviewText,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserReview.fromJson(Map<String, dynamic> json) => UserReview(
        userImage: json['userImage'] as String?,
        id: json['_id'] as String?,
        userId: json['userId'] as String?,
        userName: json['userName'] as String?,
        doctorId: json['doctorId'] as String?,
        reviewText: json['reviewText'] as String?,
        rating: (json['rating'] as num?)?.toInt(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'userImage': userImage,
        '_id': id,
        'userId': userId,
        'userName': userName,
        'doctorId': doctorId,
        'reviewText': reviewText,
        'rating': rating,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
