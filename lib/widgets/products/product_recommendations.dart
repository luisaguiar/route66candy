import 'package:route66candy/constants/style.dart';
import 'package:route66candy/controllers/product_controller.dart';
import 'package:route66candy/models/product/product.dart';
import 'package:route66candy/widgets/products/product_tile_recommended.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class ProductRecommendations extends StatelessWidget {
  final String? brand;

  const ProductRecommendations({Key? key, this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 200,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 40,
        ),
        const CustomText(
          text: 'Picked for you',
          weight: FontWeight.bold,
          size: 16,
        ),
        CustomText(
          text:
              'Other customers who love ${brand ?? 'this item'} also love these',
          weight: FontWeight.bold,
          size: 12,
          color: dark.withOpacity(.5),
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: Wrap(
            children: [
              Center(
                child: FutureBuilder(
                  future: getRecommendedProducts(),
                  builder: (_, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.none &&
                        !snapshot.hasData) {
                      return Container(
                        height: 600,
                      );
                    } else if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data.products.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Product product = snapshot.data.products[index];
                          return ProductTileRecommended(product: product);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          // Prevents child items from changing height when expanding the browser
                          mainAxisExtent: 268,
                        ),
                      );
                    }

                    return const CircularProgressIndicator(
                      color: Colors.pink,
                      strokeWidth: 1,
                    ); // displays while loading data
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
