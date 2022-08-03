import 'dart:math';

import 'package:route66candy/constants/style.dart';
import 'package:route66candy/models/product/product.dart';
import 'package:route66candy/widgets/products/helpers/add_to_cart_button.dart';
import 'package:route66candy/widgets/products/helpers/rating_combo.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class ProductDetailsCard extends StatelessWidget {
  final Product product;

  const ProductDetailsCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: SizedBox(
          width: 300,
          height: 400,
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: product.name,
                  size: 16,
                ),
                RatingCombo(
                    rating: product.rating ?? 0.0,
                    count: product.rated_by ?? 0),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      text: '\$ ${product.retail}',
                      weight: FontWeight.bold,
                      size: 22,
                    ),
                    CustomText(
                      text: '   ${product.weight}',
                      color: dark.withOpacity(.6),
                      size: 12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'Product description',
                  weight: FontWeight.bold,
                  size: 12,
                ),
                Flexible(
                    child: Text(
                  product.description ?? 'No description available',
                  style: TextStyle(fontSize: 12),
                )),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'Brand',
                  size: 12,
                  weight: FontWeight.bold,
                ),
                CustomText(
                  text: product.brand ?? '',
                  size: 12,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'UPC',
                  size: 12,
                  weight: FontWeight.bold,
                ),
                CustomText(
                  text: product.upc.toString(),
                  size: 12,
                ),
                const Spacer(),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  CustomText(
                    text: 'In-stock Qty: ${Random().nextInt(100)}',
                    color: dark.withOpacity(.6),
                    size: 12,
                  ),
                  const Spacer(
                    flex: 29,
                  ),
                  const AddToCartButton()
                ]),
              ],
            ),
          ),
        ));
  }
}
