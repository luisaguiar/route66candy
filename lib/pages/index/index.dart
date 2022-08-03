import 'package:route66candy/constants/style.dart';
import 'package:route66candy/controllers/product_controller.dart';
import 'package:route66candy/models/product/product.dart';
import 'package:route66candy/widgets/carousel/carousel.dart';
import 'package:route66candy/widgets/footer/footer_main.dart';
import 'package:route66candy/widgets/products/product_tile.dart';
import 'package:route66candy/widgets/side/side_filters.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Carousel(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 200,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'Flying off the shelf right now!',
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: 'Check out our most popular items today',
                        size: 12,
                        color: dark.withOpacity(.8),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
              // const Align(
              //   alignment: Alignment.topRight,
              //   child:
              // )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 200, child: SideFilters()),
              Expanded(
                child: Wrap(
                  children: [
                    Center(
                      child: FutureBuilder(
                        future: getAllProducts(),
                        builder: (_, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.none &&
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
                                return ProductTile(
                                  id: product.id,
                                  name: product.name,
                                  imagePath: product.image_path ?? '',
                                  price: product.retail,
                                  weight: product.weight ?? '5oz',
                                  ratedBy: product.rated_by ?? 0,
                                  rating: product.rating ?? 0,
                                  productId: product.id,
                                );
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
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
