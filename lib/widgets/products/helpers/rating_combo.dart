import 'package:route66candy/widgets/products/helpers/rated_by.dart';
import 'package:route66candy/widgets/products/helpers/rating_bar.dart';
import 'package:flutter/material.dart';

class RatingCombo extends StatelessWidget {
  final double rating;
  final int count;

  const RatingCombo({Key? key, required this.rating, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar(rating: rating ?? 0.0),
        const SizedBox(
          width: 6,
        ),
        RatedBy(count: count ?? 0),
      ],
    );
  }
}
