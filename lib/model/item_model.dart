class ItemModel {
  final String title;
  DateTime? limiteDate;
  bool completed;

  ItemModel({
    required this.title,
    this.limiteDate,
    this.completed = false,
  });
}