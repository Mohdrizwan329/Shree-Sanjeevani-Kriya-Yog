import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../models/service_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  String? _couponCode;
  double _couponDiscount = 0;

  List<CartItem> get items => _items;
  String? get couponCode => _couponCode;
  double get couponDiscount => _couponDiscount;
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  bool get isEmpty => _items.isEmpty;

  double get subtotal => _items.fold(0, (sum, item) => sum + item.totalPrice);
  double get totalDiscount => _couponDiscount;
  double get taxes => subtotal * 0.18;
  double get total => subtotal - totalDiscount + taxes;

  void addItem(ServiceModel service) {
    final existingIndex = _items.indexWhere((item) => item.serviceId == service.id);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(
        serviceId: service.id,
        serviceName: service.name,
        serviceImage: service.image,
        categoryName: '',
        price: service.price,
        originalPrice: service.originalPrice,
        duration: service.duration,
      ));
    }
    notifyListeners();
  }

  void removeItem(String serviceId) {
    _items.removeWhere((item) => item.serviceId == serviceId);
    notifyListeners();
  }

  void incrementQuantity(String serviceId) {
    final index = _items.indexWhere((item) => item.serviceId == serviceId);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String serviceId) {
    final index = _items.indexWhere((item) => item.serviceId == serviceId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void applyCoupon(String code, double discount) {
    _couponCode = code;
    _couponDiscount = discount;
    notifyListeners();
  }

  void removeCoupon() {
    _couponCode = null;
    _couponDiscount = 0;
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _couponCode = null;
    _couponDiscount = 0;
    notifyListeners();
  }
}
