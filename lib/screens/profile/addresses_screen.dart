import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/dummy_data.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = DummyData.currentUser.addresses;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(title: const Text('Manage Addresses')),
      body: Column(
        children: [
          // Add New Address
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: ListTile(
              leading: const Icon(Icons.add_location_alt, color: AppColors.accent),
              title: const Text(
                'Add New Address',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.accent,
                ),
              ),
              trailing: const Icon(Icons.chevron_right, color: AppColors.accent),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 8),
          // Saved Addresses
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final addr = addresses[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: ListTile(
                    leading: Icon(
                      addr.label == 'Home' ? Icons.home : Icons.work,
                      color: AppColors.textPrimary,
                    ),
                    title: Row(
                      children: [
                        Text(
                          addr.label,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        if (addr.isDefault) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.ratingGreen.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'DEFAULT',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: AppColors.ratingGreen,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    subtitle: Text(
                      '${addr.fullAddress}\n${addr.landmark.isNotEmpty ? '${addr.landmark}, ' : ''}${addr.city} - ${addr.pincode}',
                      style: const TextStyle(fontSize: 13, height: 1.4),
                    ),
                    trailing: PopupMenuButton(
                      icon: const Icon(Icons.more_vert, color: AppColors.textHint),
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: 'edit', child: Text('Edit')),
                        const PopupMenuItem(value: 'delete', child: Text('Delete')),
                        if (!addr.isDefault)
                          const PopupMenuItem(value: 'default', child: Text('Set as Default')),
                      ],
                    ),
                    isThreeLine: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
