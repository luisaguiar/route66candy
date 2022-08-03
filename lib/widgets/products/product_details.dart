import 'package:route66candy/controllers/product_controller.dart';
import 'package:route66candy/models/product/product.dart';
import 'package:route66candy/widgets/products/product_details_card.dart';
import 'package:route66candy/widgets/products/product_recommendations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class ProductDetails extends StatelessWidget {
  final int id;

  const ProductDetails({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imageNotFound = 'assets/images/image-not-found.png';
    // late String category = '';

    return Column(
      children: [
        FutureBuilder(
          future: getProduct(id),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                !snapshot.hasData) {
              return Container(
                height: 600,
              );
            } else if (snapshot.hasData) {
              Product product = snapshot.data;

              /// Show the product details widget after the data has loaded
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BreadCrumb(
                    items: <BreadCrumbItem>[
                      BreadCrumbItem(content: const Text('Shop')),
                      BreadCrumbItem(
                          content: Text(product.category ?? 'Candy')),
                      BreadCrumbItem(content: Text('${product.name}')),
                    ],
                    divider: const Icon(Icons.chevron_right),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 300,
                            child: Image.asset(
                                product.image_path ?? imageNotFound)),
                        const SizedBox(
                          width: 38,
                        ),
                        ProductDetailsCard(product: product),
                      ])
                ],
              );
            }

            return const CircularProgressIndicator(
              color: Colors.pink,
              strokeWidth: 1,
            ); // displays while loading data
          },
        ),
        const ProductRecommendations(),
      ],
    );
  }
}
