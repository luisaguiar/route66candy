import 'package:route66candy/constants/controllers.dart';
import 'package:route66candy/constants/style.dart';
import 'package:route66candy/models/product/product.dart';
import 'package:route66candy/routing/routes.dart';
import 'package:route66candy/widgets/products/helpers/add_to_cart_button.dart';
import 'package:route66candy/widgets/products/helpers/add_to_cart_button_icon.dart';
import 'package:route66candy/widgets/products/helpers/rating_combo.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class ProductTileRecommended extends StatelessWidget {
  final Product product;

  const ProductTileRecommended({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    const String imageNotFound = 'assets/images/image-not-found.png';

    return InkResponse(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            child: Container(
              width: 164,
              height: 180,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: light,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: light, width: 1)),
              child: Column(children: [
                Image.asset(product.image_path ?? imageNotFound, height: 100),
                Row(
                  children: [
                    CustomText(
                      text: '\$ ${product.retail}',
                      weight: FontWeight.bold,
                    ),
                    SizedBox(width: _width / 88),
                    CustomText(
                      text: product.weight ?? '',
                      size: 10,
                      color: dark.withOpacity(.4),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: product.name,
                      size: 14,
                    ),
                  ),
                ),
                RatingCombo(
                    rating: product.rating ?? 0.0,
                    count: product.rated_by ?? 0),
              ]),
            ),
          ),
          const Positioned(
            left: 80,
            top: -10,
            child: AddToCartButtonIcon(),
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: const [
          //     Spacer(),
          //     AddToCartButtonIcon(),
          //   ],
          // ),
        ],
      ),
      onTap: () {
        navigationController
            .navigatTo('$productDetailsPageRoute/${product.id}');
      },
    );
  }
}
