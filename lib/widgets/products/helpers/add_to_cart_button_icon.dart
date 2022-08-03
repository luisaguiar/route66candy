import 'package:route66candy/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddToCartButtonIcon extends StatelessWidget {
  const AddToCartButtonIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
          width: 100,
          height: 40,
          child: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            backgroundColor: candyPink,
            child: const FaIcon(
              FontAwesomeIcons.bagShopping,
              size: 10,
            ),
          )),
    );
  }
}
