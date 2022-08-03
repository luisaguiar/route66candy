import 'package:route66candy/models/product/product.dart';

class ProductsList {
  final List<Product> products;

  ProductsList({required this.products});

  factory ProductsList.fromJson(List<dynamic> parsedJson) {
    List<Product> products = <Product>[];
    products = parsedJson.map((i) => Product.fromJson(i)).toList();

    return ProductsList(
      products: products,
    );
  }
}
