import 'package:flutter/material.dart';

class Product {
  final int? id;
  final String? title, description, category;
  final List<String>? images;
  final List<Color>? colors;
  final double? rating, price;
  final bool? isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.category,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/products/cauliflower_1.png",
      "assets/products/cauliflower_2.png",
      "assets/products/cauliflower_3.png",
      "assets/products/cauliflower_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Cauliflower",
    category: "vegetable",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/products/Onions.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Onion",
    category: "vegetable",
    price: 50.0,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/products/corn.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Corn",
    category: "dry_fruit",
    price: 260.5,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/products/ginger.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Ginger",
    category: "vegetable",
    price: 200.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Sabzi dekho description ch ke rkhya a. Jeri kam de cheez a o check kro.............";
