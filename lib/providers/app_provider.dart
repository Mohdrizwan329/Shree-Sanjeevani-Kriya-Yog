import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../constants/dummy_data.dart';

class AppProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  UserModel? _currentUser;
  String _selectedLocation = 'New Delhi';
  int _bottomNavIndex = 0;

  bool get isLoggedIn => _isLoggedIn;
  UserModel? get currentUser => _currentUser;
  String get selectedLocation => _selectedLocation;
  int get bottomNavIndex => _bottomNavIndex;

  void login() {
    _isLoggedIn = true;
    _currentUser = DummyData.currentUser;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _currentUser = null;
    notifyListeners();
  }

  void setLocation(String location) {
    _selectedLocation = location;
    notifyListeners();
  }

  void setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }
}
