class CartItem {
  final String serviceId;
  final String serviceName;
  final String serviceImage;
  final String categoryName;
  final double price;
  final double originalPrice;
  int quantity;
  final String duration;

  CartItem({
    required this.serviceId,
    required this.serviceName,
    this.serviceImage = '',
    this.categoryName = '',
    required this.price,
    this.originalPrice = 0,
    this.quantity = 1,
    this.duration = '30 mins',
  });

  double get totalPrice => price * quantity;
  bool get hasDiscount => originalPrice > price;
}

class CartModel {
  final List<CartItem> items;
  final String? couponCode;
  final double couponDiscount;

  CartModel({
    this.items = const [],
    this.couponCode,
    this.couponDiscount = 0,
  });

  double get subtotal => items.fold(0, (sum, item) => sum + item.totalPrice);
  double get totalDiscount => couponDiscount;
  double get taxes => subtotal * 0.18;
  double get total => subtotal - totalDiscount + taxes;
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  bool get isEmpty => items.isEmpty;
}
