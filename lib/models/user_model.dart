class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String profileImage;
  final List<AddressModel> addresses;
  final double walletBalance;
  final bool isUcPlusMember;
  final String referralCode;

  UserModel({
    required this.id,
    required this.name,
    this.email = '',
    required this.phone,
    this.profileImage = '',
    this.addresses = const [],
    this.walletBalance = 0,
    this.isUcPlusMember = false,
    this.referralCode = '',
  });
}

class AddressModel {
  final String id;
  final String label;
  final String fullAddress;
  final String landmark;
  final String city;
  final String pincode;
  final double latitude;
  final double longitude;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.label,
    required this.fullAddress,
    this.landmark = '',
    required this.city,
    required this.pincode,
    this.latitude = 0,
    this.longitude = 0,
    this.isDefault = false,
  });
}
