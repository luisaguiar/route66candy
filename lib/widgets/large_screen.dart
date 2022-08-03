import 'package:route66candy/helpers/local_navigator.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: 1000,
      height: 1200, // Need to figure out how to size it correctly
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: localNavigator(),
              ))
        ],
      ),
    );
  }
}
