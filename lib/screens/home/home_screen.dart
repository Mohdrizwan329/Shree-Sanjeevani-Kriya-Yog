import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/dummy_data.dart';
import '../../providers/app_provider.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/banner_carousel.dart';
import '../../widgets/category_card.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/section_header.dart';
import '../../widgets/service_card.dart';
import '../../widgets/trust_badge.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverToBoxAdapter(
              child: _buildAppBar(context, appProvider),
            ),
            // Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                child: SearchBarWidget(
                  onTap: () => Navigator.pushNamed(context, '/search'),
                ),
              ),
            ),
            // Banner Carousel
            SliverToBoxAdapter(
              child: BannerCarousel(banners: DummyData.banners),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            // Trust Badges
            const SliverToBoxAdapter(child: TrustBadgeRow()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // Categories Grid
            SliverToBoxAdapter(
              child: _buildCategoriesSection(context),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // Insta Help Section
            SliverToBoxAdapter(
              child: _buildInstaHelpSection(context),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // Popular Services
            SliverToBoxAdapter(
              child: _buildPopularServices(context),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // Most Booked Services
            SliverToBoxAdapter(
              child: _buildMostBookedSection(context),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // Wellness Plus Banner
            const SliverToBoxAdapter(child: UCPromiseBanner()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // Recently Launched
            SliverToBoxAdapter(
              child: _buildNewlyLaunchedSection(context),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // Cleaning & Pest Control
            SliverToBoxAdapter(
              child: _buildCleaningSection(context),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // Offers Section
            SliverToBoxAdapter(
              child: _buildOffersSection(context),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // All Services List
            SliverToBoxAdapter(
              child: _buildAllServicesSection(context),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, AppProvider appProvider) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      color: AppColors.white,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                _showLocationPicker(context);
              },
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: AppColors.primary, size: 22),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              appProvider.selectedLocation,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_down, size: 20),
                          ],
                        ),
                        const Text(
                          'Green Park, New Delhi',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Wallet
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/wallet'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surfaceBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.account_balance_wallet, size: 18, color: AppColors.accent),
                  SizedBox(width: 4),
                  Text(
                    '₹1,250',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Notifications
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/notifications'),
            child: Stack(
              children: [
                const Icon(Icons.notifications_outlined, size: 26, color: AppColors.textPrimary),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'All Services'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.72,
              crossAxisSpacing: 8,
              mainAxisSpacing: 12,
            ),
            itemCount: DummyData.categories.length,
            itemBuilder: (context, index) {
              final category = DummyData.categories[index];
              return CategoryCard(
                category: category,
                onTap: () {
                  Navigator.pushNamed(context, '/category', arguments: category);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInstaHelpSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4A148C), Color(0xFF7B1FA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'PANCHAKARMA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ayurvedic Detox\n& Rejuvenation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Vamana • Virechana • Basti • Nasya',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      color: Color(0xFF4A148C),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.spa,
              size: 48,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularServices(BuildContext context) {
    final popularServices = DummyData.services.where((s) => s.isBestSeller).toList();
    return Column(
      children: [
        SectionHeader(
          title: 'Most Booked Services',
          actionText: 'See all',
          onAction: () {},
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: popularServices.length,
            itemBuilder: (context, index) {
              return ServiceCardHorizontal(
                service: popularServices[index],
                onTap: () {
                  Navigator.pushNamed(context, '/service-detail',
                      arguments: popularServices[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMostBookedSection(BuildContext context) {
    final cartProvider = context.read<CartProvider>();
    final topServices = DummyData.services.toList()
      ..sort((a, b) => b.bookingCount.compareTo(a.bookingCount));
    final top5 = topServices.take(5).toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          SectionHeader(
            title: 'Abhyanga & Massage',
            actionText: 'View all',
            onAction: () {
              Navigator.pushNamed(context, '/category',
                  arguments: DummyData.categories[0]);
            },
          ),
          const SizedBox(height: 8),
          // Sub-category chips
          SizedBox(
            height: 36,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: [
                _buildChip('All', true),
                _buildChip('Abhyanga', false),
                _buildChip('Shirodhara', false),
                _buildChip('Swedana', false),
                _buildChip('Basti', false),
                _buildChip('Marma', false),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: top5.length > 3 ? 3 : top5.length,
            itemBuilder: (context, index) {
              return ServiceCard(
                service: top5[index],
                onTap: () {
                  Navigator.pushNamed(context, '/service-detail',
                      arguments: top5[index]);
                },
                onAddToCart: () {
                  cartProvider.addItem(top5[index]);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${top5[index].name} added to cart'),
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.surfaceBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isSelected ? AppColors.white : AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildNewlyLaunchedSection(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Newly Launched'),
        const SizedBox(height: 8),
        SizedBox(
          height: 160,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              _buildNewlyLaunchedCard(
                'Shirodhara Package',
                '3 sessions at ₹2,999',
                Icons.water_drop,
                const Color(0xFF1565C0),
              ),
              _buildNewlyLaunchedCard(
                'Panchakarma Detox',
                'Complete 7-day program',
                Icons.medical_services,
                const Color(0xFFB71C1C),
              ),
              _buildNewlyLaunchedCard(
                'Marma Wellness',
                '107 point therapy pack',
                Icons.touch_app,
                const Color(0xFFBF360C),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewlyLaunchedCard(String title, String subtitle, IconData icon, Color color) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withValues(alpha: 0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'NEW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCleaningSection(BuildContext context) {
    final cleaningServices = DummyData.services
        .where((s) => s.categoryId == 'cat_19' || s.categoryId == 'cat_20' || s.categoryId == 'cat_22' || s.categoryId == 'cat_23' || s.categoryId == 'cat_24')
        .toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          SectionHeader(
            title: 'Basti Therapies',
            actionText: 'View all',
            onAction: () {},
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: cleaningServices.length,
              itemBuilder: (context, index) {
                return ServiceCardHorizontal(
                  service: cleaningServices[index],
                  onTap: () {
                    Navigator.pushNamed(context, '/service-detail',
                        arguments: cleaningServices[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOffersSection(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Offers for you'),
        SizedBox(
          height: 120,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: DummyData.coupons.length,
            itemBuilder: (context, index) {
              final coupon = DummyData.coupons[index];
              return Container(
                width: 260,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.accent.withValues(alpha: 0.3),
                    style: BorderStyle.solid,
                  ),
                  boxShadow: AppColors.cardShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            coupon['code'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.accent,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.local_offer, size: 16, color: AppColors.accent),
                      ],
                    ),
                    Text(
                      coupon['title'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      coupon['description'] as String,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textHint,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAllServicesSection(BuildContext context) {
    final panchakarmaServices = DummyData.services
        .where((s) => s.categoryId == 'cat_27' || s.categoryId == 'cat_28' || s.categoryId == 'cat_30' || s.categoryId == 'cat_31')
        .toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          SectionHeader(
            title: 'Panchakarma & Marma',
            actionText: 'View all',
            onAction: () {
              Navigator.pushNamed(context, '/category',
                  arguments: DummyData.categories[26]);
            },
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: panchakarmaServices.length,
              itemBuilder: (context, index) {
                return ServiceCardHorizontal(
                  service: panchakarmaServices[index],
                  onTap: () {
                    Navigator.pushNamed(context, '/service-detail',
                        arguments: panchakarmaServices[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showLocationPicker(BuildContext context) {
    final locations = ['New Delhi', 'Mumbai', 'Bangalore', 'Hyderabad', 'Chennai', 'Pune', 'Kolkata', 'Ahmedabad', 'Jaipur', 'Lucknow'];

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select your city',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Services available in your area',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              // Current Location
              ListTile(
                leading: const Icon(Icons.my_location, color: AppColors.accent),
                title: const Text('Use Current Location',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Using GPS'),
                onTap: () => Navigator.pop(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: AppColors.border),
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.location_city, color: AppColors.textHint),
                      title: Text(locations[index]),
                      onTap: () {
                        context.read<AppProvider>().setLocation(locations[index]);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
