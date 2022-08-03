import 'package:route66candy/constants/controllers.dart';
import 'package:route66candy/constants/style.dart';
import 'package:route66candy/routing/routes.dart';
import 'package:route66candy/widgets/products/helpers/add_to_cart_button.dart';
import 'package:route66candy/widgets/products/helpers/rating_combo.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final int id;
  final String imagePath;
  final double price;
  final String? weight;
  final double rating;
  final String name;
  final int ratedBy;
  final int productId;

  const ProductTile(
      {Key? key,
      required this.id,
      required this.imagePath,
      required this.price,
      this.weight,
      required this.rating,
      required this.name,
      required this.ratedBy,
      required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    const String imageNotFound = 'assets/images/image-not-found.png';

    final Image productImage = imagePath != ''
        ? Image.asset(imagePath, height: 130)
        : Image.asset(imageNotFound, height: 130);

    return InkResponse(
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Container(
          width: 200,
          height: 260,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: light,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: light, width: 1)),
          child: Column(children: [
            productImage,
            Container(
              child: Row(
                children: [
                  CustomText(
                    text: '\$ $price',
                    weight: FontWeight.bold,
                  ),
                  SizedBox(width: _width / 88),
                  CustomText(
                    text: '$weight',
                    size: 10,
                    color: dark.withOpacity(.4),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: name,
                  size: 14,
                ),
              ),
            ),
            RatingCombo(rating: rating, count: ratedBy),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(),
                AddToCartButton(),
              ],
            ),
          ]),
        ),
      ),
      onTap: () {
        navigationController.navigatTo('$productDetailsPageRoute/$id');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => SmallScreen()),
        // );
      },
    );
  }
}
