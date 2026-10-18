class SabrModel {
  final int? id;
  const SabrModel({this.id});

  factory SabrModel.fromJson(Map<String, dynamic> json) =>
      SabrModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
