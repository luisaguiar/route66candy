import 'package:route66candy/controllers/product_controller.dart';
import 'package:route66candy/models/product/product.dart';
import 'package:route66candy/widgets/products/product_tile_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class ProductsByCategory extends StatelessWidget {
  final String category;

  const ProductsByCategory({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imageNotFound = 'assets/images/image-not-found.png';

    return Column(
      children: [
        FutureBuilder(
          future: getAllProducts(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                !snapshot.hasData) {
              return Container(
                height: 800,
              );
            } else if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BreadCrumb(
                    items: <BreadCrumbItem>[
                      BreadCrumbItem(content: const Text('Shop')),
                      BreadCrumbItem(content: Text(category)),
                    ],
                    divider: const Icon(Icons.chevron_right),
                  ),
                  SizedBox(
                    width: 580,
                    child: GridView.builder(
                      itemCount: snapshot.data.products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Product product = snapshot.data.products[index];
                        return ProductTileHorizontal(product: product);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        // Prevents child items from changing height when expanding the browser
                        mainAxisExtent: 268,
                      ),
                    ),
                  )
                ],
              );
            }

            return const CircularProgressIndicator(
              color: Colors.pink,
              strokeWidth: 1,
            ); // displays while loading data
          },
        ),
      ],
    );
  }
}
