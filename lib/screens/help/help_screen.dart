import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/dummy_data.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(title: const Text('Help Center')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Describe your issue...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Quick Actions
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Actions',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildQuickAction(Icons.chat_bubble_outline, 'Chat with us', AppColors.accent)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildQuickAction(Icons.call_outlined, 'Call Support', AppColors.ratingGreen)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildQuickAction(Icons.email_outlined, 'Email Us', AppColors.warning)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Help Topics
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Help Topics',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  _buildHelpTopic(Icons.calendar_today, 'Booking Related', 'Reschedule, cancel, or modify bookings'),
                  _buildHelpTopic(Icons.payment, 'Payment & Refund', 'Payment issues, refund status'),
                  _buildHelpTopic(Icons.person, 'Professional Related', 'Issues with professional'),
                  _buildHelpTopic(Icons.build, 'Service Related', 'Service quality, warranty claims'),
                  _buildHelpTopic(Icons.local_offer, 'Offers & Coupons', 'Coupon not working, offers'),
                  _buildHelpTopic(Icons.account_circle, 'Account & Profile', 'Login issues, profile updates'),
                  _buildHelpTopic(Icons.shield, 'Safety & Trust', 'Safety concerns, verification'),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // FAQs
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Frequently Asked Questions',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  ...DummyData.faqs.map((faq) => ExpansionTile(
                        title: Text(
                          faq['question']!,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Text(
                              faq['answer']!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpTopic(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.surfaceBg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textHint)),
      trailing: const Icon(Icons.chevron_right, color: AppColors.textHint, size: 20),
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
    );
  }
}
