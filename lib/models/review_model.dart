class ReviewModel {
  final String id;
  final String userName;
  final String userImage;
  final double rating;
  final String comment;
  final DateTime date;
  final String serviceId;
  final List<String> images;

  ReviewModel({
    required this.id,
    required this.userName,
    this.userImage = '',
    required this.rating,
    required this.comment,
    required this.date,
    required this.serviceId,
    this.images = const [],
  });
}
