import 'package:route66candy/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: 100,
        height: 40,
        child: FittedBox(
          child: FloatingActionButton.extended(
            label: const Text('Add to Cart'),
            backgroundColor: candyPink,
            icon: const FaIcon(
              FontAwesomeIcons.bagShopping,
              size: 16,
            ),
            onPressed: () {
              // TODO:: add to cart
            },
          ),
        ),
      ),
    );
  }
}
