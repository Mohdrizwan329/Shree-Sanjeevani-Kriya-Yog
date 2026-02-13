import 'package:flutter/material.dart';

class BannerModel {
  final String id;
  final String title;
  final String subtitle;
  final String image;
  final Color backgroundColor;
  final Color textColor;
  final String actionText;
  final String actionRoute;
  final String discount;

  BannerModel({
    required this.id,
    required this.title,
    this.subtitle = '',
    this.image = '',
    this.backgroundColor = const Color(0xFF6C63FF),
    this.textColor = const Color(0xFFFFFFFF),
    this.actionText = '',
    this.actionRoute = '',
    this.discount = '',
  });
}
