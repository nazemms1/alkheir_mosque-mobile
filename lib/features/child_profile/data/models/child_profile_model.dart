class ChildProfileModel {
  final int? id;
  const ChildProfileModel({this.id});

  factory ChildProfileModel.fromJson(Map<String, dynamic> json) =>
      ChildProfileModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
