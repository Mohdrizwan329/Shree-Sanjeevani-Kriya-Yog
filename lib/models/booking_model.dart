enum BookingStatus {
  upcoming,
  inProgress,
  completed,
  cancelled,
}

class BookingModel {
  final String id;
  final String serviceName;
  final String serviceImage;
  final String categoryName;
  final String providerName;
  final String providerImage;
  final double providerRating;
  final DateTime bookingDate;
  final String timeSlot;
  final String address;
  final double totalAmount;
  final double discount;
  final BookingStatus status;
  final List<BookingItem> items;
  final String paymentMethod;
  final bool isRated;

  BookingModel({
    required this.id,
    required this.serviceName,
    this.serviceImage = '',
    required this.categoryName,
    this.providerName = '',
    this.providerImage = '',
    this.providerRating = 0,
    required this.bookingDate,
    required this.timeSlot,
    required this.address,
    required this.totalAmount,
    this.discount = 0,
    required this.status,
    this.items = const [],
    this.paymentMethod = 'Cash',
    this.isRated = false,
  });
}

class BookingItem {
  final String name;
  final int quantity;
  final double price;

  BookingItem({
    required this.name,
    this.quantity = 1,
    required this.price,
  });
}
