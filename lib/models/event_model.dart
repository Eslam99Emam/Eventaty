/// Model representing an Event in the Eventaty application
class EventModel {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final String day;
  final String month;
  final String category;
  final DateTime dateTime;
  final String location;
  final bool isAttending;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.day,
    required this.month,
    required this.category,
    required this.dateTime,
    required this.location,
    this.isAttending = false,
  });

  /// Create a copy of this model with some fields replaced
  EventModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imagePath,
    String? day,
    String? month,
    String? category,
    DateTime? dateTime,
    String? location,
    bool? isAttending,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      day: day ?? this.day,
      month: month ?? this.month,
      category: category ?? this.category,
      dateTime: dateTime ?? this.dateTime,
      location: location ?? this.location,
      isAttending: isAttending ?? this.isAttending,
    );
  }
}
