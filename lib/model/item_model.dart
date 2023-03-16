class ItemModel {
  final String id;
  final String title;
  DateTime? limiteDate;
  bool completed;

  ItemModel({
    required this.id,
    required this.title,
    this.limiteDate,
    this.completed = false,
  });
}