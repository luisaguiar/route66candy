import 'package:route66candy/models/link_data.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinksColumn extends StatelessWidget {
  final String title;
  final List<LinkData> links;

  LinksColumn({Key? key, required this.title, required this.links})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            color: Colors.white,
            size: 14,
            weight: FontWeight.bold,
          ),
          const SizedBox(
            height: 6,
          ),
          ...links
              .map((link) => CustomText(
                    text: link.name,
                    color: Colors.white,
                    size: 10,
                  ))
              .toList(),
        ]);
  }
}
