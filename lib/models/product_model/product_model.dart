import 'package:storeapp/models/product_model/rating.dart';

class ProductModel {
  int? id;
  String title;
  String price;
  String description;
  String category;
  String image;
  Rating rating;

  ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic>? json) {
    return ProductModel(
      id: json?['id'] as int?,
      title: json?['title'] as String? ?? '',
      price: json?['price']?.toString() ?? '',
      description: json?['description'] as String? ?? '',
      category: json?['category'] as String? ?? '',
      image: json?['image'] as String? ?? '',
      rating: Rating.fromJson(json?['rating'] as Map<String, dynamic>?),
    );
  }
}
