import 'package:flutter/cupertino.dart';

///
///
///
class Product {
  final int id;
  final String name;
  final String? description;
  final String? brand;
  final String? category;
  final String? image_path;
  final double retail;
  final double? rating;
  final int? rated_by;
  final String? weight;
  final int? upc;

  Product({
    this.rating,
    this.rated_by,
    this.weight,
    Key? key,
    required this.id,
    this.description,
    this.brand,
    this.category,
    this.image_path,
    required this.retail,
    this.upc,
    required this.name,
  });

  @override
  String toString() {
    return '$id - $name - $brand';
  }

  @override
  bool operator ==(Object other) {
    return (other.runtimeType != runtimeType)
        ? false
        : other is Product &&
            other.name == name &&
            other.description == description &&
            other.category == category &&
            other.id == id &&
            other.upc == upc &&
            other.brand == brand;
  }

  @override
  int get hashCode => Object.hash(id, name);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      brand: json['brand'],
      category: json['category'],
      image_path: json['image_path'],
      retail: json['retail'],
      weight: json['weight'],
      rating: json['rating'],
      rated_by: json['rated_by'],
      upc: json['upc'],
    );
  }
}
