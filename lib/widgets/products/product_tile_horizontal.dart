import 'package:route66candy/constants/controllers.dart';
import 'package:route66candy/constants/style.dart';
import 'package:route66candy/models/product/product.dart';
import 'package:route66candy/routing/routes.dart';
import 'package:route66candy/widgets/products/helpers/rating_combo.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductTileHorizontal extends StatelessWidget {
  final Product product;

  const ProductTileHorizontal({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    const String imageNotFound = 'assets/images/image-not-found.png';

    return Card(
        elevation: 2,
        child: SizedBox(
            height: 300,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Image.asset(
                          product.image_path ?? imageNotFound,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 440,
                              child: Flexible(
                                  child: Text(
                                product.name,
                              )),
                            ),
                            RatingCombo(
                                rating: product.rating ?? 0.0,
                                count: product.rated_by ?? 0),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 440,
                              // child: Flexible(
                              child: Text(
                                '${product.description!.length < 300 ? product.description : product.description?.substring(0, 300)}...',
                                style: const TextStyle(fontSize: 12),
                              ),
                              //     Text(
                              //   product.description ?? '',
                              //   style: TextStyle(fontSize: 12),
                              // )
                              // ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: '\$ ${product.retail}',
                                  weight: FontWeight.bold,
                                ),
                                // const Spacer(),
                                const SizedBox(
                                  width: 295,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 30,
                                  child: FloatingActionButton.extended(
                                    label: const Text('More info',
                                        style: TextStyle(fontSize: 12)),
                                    backgroundColor: candyPink,
                                    onPressed: () {
                                      navigationController.navigatTo(
                                          '$productDetailsPageRoute/${product.id}');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ],
                  ),
                ],
              ),
            )));
  }
}
