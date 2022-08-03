import 'package:route66candy/constants/style.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class RatedBy extends StatelessWidget {
  final int count;
  const RatedBy({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: '($count)',
      size: 10,
      color: dark.withOpacity(.4),
    );
  }
}
