class ProviderModel {
  final String id;
  final String name;
  final String profileImage;
  final double rating;
  final int reviewCount;
  final int experience;
  final int servicesCompleted;
  final bool isVerified;
  final List<String> skills;
  final String bio;
  final String phoneNumber;

  ProviderModel({
    required this.id,
    required this.name,
    this.profileImage = '',
    this.rating = 4.5,
    this.reviewCount = 0,
    this.experience = 0,
    this.servicesCompleted = 0,
    this.isVerified = true,
    this.skills = const [],
    this.bio = '',
    this.phoneNumber = '',
  });
}
