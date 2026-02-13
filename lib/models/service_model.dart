class ServiceModel {
  final String id;
  final String name;
  final String description;
  final String categoryId;
  final String subCategoryId;
  final double price;
  final double originalPrice;
  final int discount;
  final String duration;
  final double rating;
  final int reviewCount;
  final String image;
  final List<String> images;
  final List<String> included;
  final List<String> excluded;
  final bool isBestSeller;
  final bool isNew;
  final int bookingCount;
  final String warranty;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    this.subCategoryId = '',
    required this.price,
    this.originalPrice = 0,
    this.discount = 0,
    this.duration = '30 mins',
    this.rating = 4.5,
    this.reviewCount = 0,
    this.image = '',
    this.images = const [],
    this.included = const [],
    this.excluded = const [],
    this.isBestSeller = false,
    this.isNew = false,
    this.bookingCount = 0,
    this.warranty = '',
  });

  double get effectivePrice => discount > 0 ? price : price;
  bool get hasDiscount => discount > 0 && originalPrice > price;
}
