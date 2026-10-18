class SupervisorModel {
  final int? id;
  const SupervisorModel({this.id});

  factory SupervisorModel.fromJson(Map<String, dynamic> json) =>
      SupervisorModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
