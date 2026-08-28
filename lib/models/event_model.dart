class EventModel {
  final String id;
  final String image;
  final String categoryId;
  final String category;
  final String date;
  final String title;
  final String location;
  final String price;

  const EventModel({
    required this.id,
    required this.image,
    required this.categoryId,
    required this.category,
    required this.date,
    required this.title,
    required this.location,
    required this.price,
  });
}
