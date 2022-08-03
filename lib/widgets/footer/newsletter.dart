import 'package:route66candy/constants/style.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class Newsletter extends StatelessWidget {
  const Newsletter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CustomText(
          text: 'Newsletter',
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 300,
          child: Text(
            'Stay up to date on the latest and greatest, get special newsletter member discounts and lots of inspiration',
            // 'Subscribe to receive our offers in preview and enjoy 10% off on your first order',
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 300,
          height: 30,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter your email address',
              contentPadding: const EdgeInsets.all(10),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: candyPink),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
