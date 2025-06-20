class DatumSpecialization {
  String? name;
  String? specialization;

  DatumSpecialization({this.name, this.specialization});

  factory DatumSpecialization.fromJson(Map<String, dynamic> json) =>
      DatumSpecialization(
        name: json['name'] as String?,
        specialization: json['specialization'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'specialization': specialization,
      };
}
