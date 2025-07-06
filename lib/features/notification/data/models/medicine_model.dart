import 'package:intl/intl.dart';

class MedicineModel {
  final String name;
  final String dosage;
  final String time;
  final int numberOfTimes;
  final String? doctorName;
  final String timeOfCreation;
  final String? id;
  final bool isRead;

  MedicineModel({
    required this.name,
    required this.dosage,
    required this.time,
    required this.numberOfTimes,
    required this.doctorName,
    required this.timeOfCreation,
    required this.id,
    this.isRead = false,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      name: json['medicineName'],
      dosage: json['medicineDosage'],
      time: json['time'][0] ?? '08:00 AM',
      numberOfTimes: json['NumberOfTimes'] ?? 2,
      doctorName: json['doctorId']['name'] ?? 'Unknown Doctor',
      timeOfCreation: json['createdAt'] ?? DateTime.now().toIso8601String(),
      id: json['_id'] ?? 'unknown_id',
    );
  }
  MedicineModel copyWith({
    String? name,
    String? dosage,
    String? time,
    int? numberOfTimes,
    String? doctorName,
    String? timeOfCreation,
    String? id,
    bool? isRead,
  }) {
    print('copyWith called, isRead: $isRead');
    return MedicineModel(
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      time: time ?? this.time,
      numberOfTimes: numberOfTimes ?? this.numberOfTimes,
      doctorName: doctorName ?? this.doctorName,
      timeOfCreation: timeOfCreation ?? this.timeOfCreation,
      id: id ?? this.id,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toJson() => {
        'medicineName': name,
        'medicineDosage': dosage,
        'time': time,
        'NumberOfTimes': numberOfTimes,
        'doctorId': {
          'name': doctorName,
        },
        'createdAt': timeOfCreation,
        '_id': id,
      };

  String get formattedCreationTime {
    final date = DateTime.parse(timeOfCreation);
    return DateFormat('hh:mm a').format(date);
  }
}
