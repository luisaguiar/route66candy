import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:route66candy/widgets/text/shadow_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupPromo extends StatelessWidget {
  const SignupPromo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      width: 800,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(),
            SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: ShadowText(
                      text: 'Candy Club',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: ShadowText(
                      text:
                          'Our members get 10% off on all orders, plus a monthly box full of candy you\'ve never heard of',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 60,
                    child: FittedBox(
                      child: FloatingActionButton.extended(
                        label: const Text('JOIN NOW'),
                        backgroundColor: Colors.blue,
                        onPressed: () {
                          // TODO:: Open join now form
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(
            //     width: 300,
            //     child: TextField(
            //       decoration: InputDecoration(
            //         filled: true,
            //         fillColor: Colors.white,
            //         border: OutlineInputBorder(),
            //         hintText: 'Enter a search term',
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}
