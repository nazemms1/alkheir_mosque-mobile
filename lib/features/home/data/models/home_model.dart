class HomeModel {
  final int? id;
  const HomeModel({this.id});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      HomeModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
