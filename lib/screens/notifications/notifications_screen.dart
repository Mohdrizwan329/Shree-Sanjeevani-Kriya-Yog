import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      _NotifItem('Booking Confirmed', 'Your AC service booking (BK-2024001) is confirmed for tomorrow at 10 AM.', Icons.check_circle, AppColors.success, '2 hours ago'),
      _NotifItem('Special Offer!', 'Get 40% off on salon services this weekend. Use code SALON40.', Icons.local_offer, AppColors.accent, '5 hours ago'),
      _NotifItem('Rate your service', 'How was your Full Home Deep Cleaning? Rate your experience.', Icons.star, AppColors.ratingGold, '1 day ago'),
      _NotifItem('Professional Assigned', 'Rahul Kumar has been assigned for your AC service. Tap to view details.', Icons.person, AppColors.info, '1 day ago'),
      _NotifItem('Cashback Credited', '₹50 cashback has been credited to your Sanjeevani Wallet.', Icons.account_balance_wallet, AppColors.ratingGreen, '2 days ago'),
      _NotifItem('New Service Available', 'Insta Help is now available in your area! Get house help in 15 minutes.', Icons.flash_on, AppColors.warning, '3 days ago'),
      _NotifItem('Booking Reminder', 'Reminder: Your cleaning service is scheduled for tomorrow at 9 AM.', Icons.alarm, AppColors.info, '4 days ago'),
      _NotifItem('Refer & Earn', 'Invite friends and earn ₹100 for each successful referral!', Icons.card_giftcard, AppColors.accent, '5 days ago'),
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Mark all read', style: TextStyle(fontSize: 13)),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
            decoration: BoxDecoration(
              color: index < 3 ? AppColors.accent.withValues(alpha: 0.03) : AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: notif.color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(notif.icon, color: notif.color, size: 22),
                  ),
                  title: Text(
                    notif.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: index < 3 ? FontWeight.w600 : FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        notif.body,
                        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notif.time,
                        style: const TextStyle(fontSize: 11, color: AppColors.textHint),
                      ),
                    ],
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  isThreeLine: true,
                ),
                const Divider(height: 1, indent: 72),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NotifItem {
  final String title;
  final String body;
  final IconData icon;
  final Color color;
  final String time;

  _NotifItem(this.title, this.body, this.icon, this.color, this.time);
}
