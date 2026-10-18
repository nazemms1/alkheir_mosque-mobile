class NotificationsModel {
  final int? id;
  const NotificationsModel({this.id});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
