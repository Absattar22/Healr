import 'datum.dart';

class DoctorNameModel {
	bool? status;
	List<Datum>? data;

	DoctorNameModel({this.status, this.data});

	factory DoctorNameModel.fromJson(Map<String, dynamic> json) {
		return DoctorNameModel(
			status: json['Status'] as bool?,
			data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'Status': status,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
