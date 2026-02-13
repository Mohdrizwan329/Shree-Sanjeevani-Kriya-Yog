import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/dummy_data.dart';
import '../../models/category_model.dart';
import '../../models/service_model.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/service_card.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String _selectedSubCategory = 'All';
  String _sortBy = 'Popular';

  List<ServiceModel> get _filteredServices {
    var services = DummyData.services
        .where((s) => s.categoryId == widget.category.id)
        .toList();

    if (_selectedSubCategory != 'All') {
      final subCat = widget.category.subCategories
          .where((sc) => sc.name == _selectedSubCategory)
          .firstOrNull;
      if (subCat != null) {
        services = services.where((s) => s.subCategoryId == subCat.id).toList();
      }
    }

    switch (_sortBy) {
      case 'Price: Low to High':
        services.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        services.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Rating':
        services.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      default:
        services.sort((a, b) => b.bookingCount.compareTo(a.bookingCount));
    }

    return services;
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<CartProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/search'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Sub-category Chips
          if (widget.category.subCategories.isNotEmpty)
            Container(
              color: AppColors.white,
              height: 50,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                children: [
                  _buildChip('All'),
                  ...widget.category.subCategories.map((sc) => _buildChip(sc.name)),
                ],
              ),
            ),
          // Sort & Filter Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.white,
            child: Row(
              children: [
                Text(
                  '${_filteredServices.length} services',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _showSortOptions,
                  child: Row(
                    children: [
                      const Icon(Icons.sort, size: 18, color: AppColors.textPrimary),
                      const SizedBox(width: 4),
                      Text(
                        _sortBy,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Services List
          Expanded(
            child: _filteredServices.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inbox, size: 64, color: AppColors.border),
                        SizedBox(height: 16),
                        Text(
                          'No services found',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredServices.length,
                    itemBuilder: (context, index) {
                      final service = _filteredServices[index];
                      return ServiceCard(
                        service: service,
                        onTap: () {
                          Navigator.pushNamed(context, '/service-detail',
                              arguments: service);
                        },
                        onAddToCart: () {
                          cartProvider.addItem(service);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${service.name} added to cart'),
                              duration: const Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    final isSelected = _selectedSubCategory == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedSubCategory = label),
      child: Container(
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
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sort By',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              ...['Popular', 'Rating', 'Price: Low to High', 'Price: High to Low']
                  .map((option) => ListTile(
                        title: Text(option),
                        leading: Icon(
                          _sortBy == option
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: _sortBy == option
                              ? AppColors.primary
                              : AppColors.textHint,
                        ),
                        onTap: () {
                          setState(() => _sortBy = option);
                          Navigator.pop(context);
                        },
                      )),
            ],
          ),
        );
      },
    );
  }
}
