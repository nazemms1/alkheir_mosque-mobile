class SplashModel {
  final int? id;
  const SplashModel({this.id});

  factory SplashModel.fromJson(Map<String, dynamic> json) =>
      SplashModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
