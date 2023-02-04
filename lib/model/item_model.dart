class ItemModel {
  final String title;
  DateTime? limiteDate;
  final bool completed;

  ItemModel({
    required this.title,
    limiteDate,
    this.completed = false,
  });
}