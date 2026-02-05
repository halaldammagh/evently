class Event {
  /// data class - model
  /// Collection Name
  static const String collectionName = 'Events';

  ///  Attributes
  String id;
  String eventName;
  String eventImage;
  String eventTitle;
  String eventDescription;
  DateTime eventDate;
  String eventTime;
  bool isFavourite;

  /// Constructor
  Event({
    this.id = '',
    required this.eventName,
    required this.eventImage,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDate,
    required this.eventTime,
    this.isFavourite = false,
  });

  /// json => object
  Event.fromFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'] as String,
        eventName: data['event_name'],
        eventImage: data['event_image'],
        eventTitle: data['event_title'] as String,
        eventDescription: data['event_description'],
        eventDate: DateTime.fromMillisecondsSinceEpoch(data['event_date']),
        eventTime: data['event_time'],
        isFavourite: data['is_favourite'] as bool,
      );

  /// object => json
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'event_name': eventName,
      'event_image': eventImage,
      'event_title': eventTitle,
      'event_description': eventDescription,
      'event_date': eventDate.millisecondsSinceEpoch,
      'event_time': eventTime,
      'is_favourite': isFavourite,
    };
  }
}
