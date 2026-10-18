class StudentPortalModel {
  final int? id;
  const StudentPortalModel({this.id});

  factory StudentPortalModel.fromJson(Map<String, dynamic> json) =>
      StudentPortalModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
