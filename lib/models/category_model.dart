import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final IconData iconData;
  final Color color;
  final String image;
  final List<SubCategoryModel> subCategories;

  CategoryModel({
    required this.id,
    required this.name,
    this.icon = '',
    required this.iconData,
    required this.color,
    this.image = '',
    this.subCategories = const [],
  });
}

class SubCategoryModel {
  final String id;
  final String name;
  final String image;
  final String categoryId;

  SubCategoryModel({
    required this.id,
    required this.name,
    this.image = '',
    required this.categoryId,
  });
}
