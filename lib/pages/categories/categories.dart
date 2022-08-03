import 'package:route66candy/widgets/products/products_by_category.dart';
import 'package:route66candy/widgets/side/side_filters.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final String category;

  const CategoriesPage({Key? key, required this.category}) : super(key: key);

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
              ProductsByCategory(category: category),
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
