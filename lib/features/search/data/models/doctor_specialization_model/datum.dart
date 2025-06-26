class Datum {
	String? image;
	String? name;
	String? specialization;
	double? rate;

	Datum({this.image, this.name, this.specialization, this.rate});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				image: json['image'] as String?,
				name: json['name'] as String?,
				specialization: json['specialization'] as String?,
				rate: (json['rate'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'image': image,
				'name': name,
				'specialization': specialization,
				'rate': rate,
			};
}
