class DatumName {
  String? name;

  DatumName({this.name});

  factory DatumName.fromJson(Map<String, dynamic> json) => DatumName(
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
