import 'package:route66candy/widgets/products/product_details.dart';
import 'package:route66candy/widgets/side/side_filters.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final int id;

  const ProductsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              SizedBox(width: 200, child: SideFilters()),
              ProductDetails(id: id),
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
