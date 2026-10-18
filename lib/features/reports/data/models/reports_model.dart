class ReportsModel {
  final int? id;
  const ReportsModel({this.id});

  factory ReportsModel.fromJson(Map<String, dynamic> json) =>
      ReportsModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
