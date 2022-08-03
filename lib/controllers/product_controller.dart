import 'dart:convert';
import 'package:route66candy/models/product/product.dart';
import 'package:route66candy/models/product/products_list.dart';
import 'package:http/http.dart' as http;

/// Get all the products
///
///
///
Future getAllProducts() async {
  final response = await http.get(Uri.parse('http://localhost/api/products'));

  return (response.statusCode == 200)
      ? ProductsList.fromJson(jsonDecode(response.body))
      : throw Exception('Failed to load products');
}

/// Get a specific product
///
///
Future<Product> getProduct(int id) async {
  final response =
      await http.get(Uri.parse('http://localhost/api/products/$id'));

  return (response.statusCode == 200)
      ? Product.fromJson(jsonDecode(response.body))
      : throw Exception('Failed to load product with id: $id');
}

/// Get recommended product
///
///
Future getRecommendedProducts() async {
  final response =
      await http.get(Uri.parse('http://localhost/api/recommended'));

  return (response.statusCode == 200)
      ? ProductsList.fromJson(jsonDecode(response.body))
      : throw Exception('Failed to load recommended products');
}

/// Get products by category
///
///
Future getProductsByCategory(String category) async {
  final response =
      await http.get(Uri.parse('http://localhost/api/products/${category}'));

  return (response.statusCode == 200)
      ? ProductsList.fromJson(jsonDecode(response.body))
      : throw Exception('Failed to load products by category');
}
