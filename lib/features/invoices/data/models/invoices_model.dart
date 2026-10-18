class InvoicesModel {
  final int? id;
  const InvoicesModel({this.id});

  factory InvoicesModel.fromJson(Map<String, dynamic> json) =>
      InvoicesModel(id: json['id'] as int?);

  Map<String, dynamic> toJson() => {'id': id};
}
