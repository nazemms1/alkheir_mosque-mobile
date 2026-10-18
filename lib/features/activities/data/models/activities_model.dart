class ActivitiesModel {
  final int? id;
  const ActivitiesModel({this.id});

  factory ActivitiesModel.fromJson(Map<String, dynamic> json) =>
      ActivitiesModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
