import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final bool enabled;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String hint;

  const SearchBarWidget({
    super.key,
    this.onTap,
    this.enabled = false,
    this.controller,
    this.onChanged,
    this.hint = 'Search for services',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surfaceBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: AppColors.textHint, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: enabled
                  ? TextField(
                      controller: controller,
                      onChanged: onChanged,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: const TextStyle(
                          color: AppColors.textHint,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        filled: false,
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    )
                  : Text(
                      hint,
                      style: const TextStyle(
                        color: AppColors.textHint,
                        fontSize: 14,
                      ),
                    ),
            ),
            const Icon(Icons.mic_none, color: AppColors.textHint, size: 22),
          ],
        ),
      ),
    );
  }
}
