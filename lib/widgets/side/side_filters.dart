import 'package:route66candy/constants/product_categories.dart';
import 'package:route66candy/constants/product_colors.dart';
import 'package:route66candy/widgets/forms/filter_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideFilters extends StatelessWidget {
  SideFilters({Key? key}) : super(key: key);

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 2,
      headerBackgroundColorOpened: Colors.black54,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      contentBorderWidth: 0,
      children: [
        AccordionSection(
          isOpen: true,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: Colors.blue,
          headerBackgroundColorOpened: Colors.purple,
          // headerBackgroundColorOpened: Colors.pink,
          header: Text('Categories', style: _headerStyle),
          content: SizedBox(
            child: Column(
              children: categories
                  .map((catgegory) => FilterCheckbox(
                        text: catgegory,
                      ))
                  .toList(),
            ),
          ),
          // contentHorizontalPadding: 20,
          // contentBorderWidth: 1,
          contentBorderColor: Colors.transparent,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
        AccordionSection(
            isOpen: false,
            leftIcon: const FaIcon(
              FontAwesomeIcons.palette,
              size: 16,
              color: Colors.white,
            ),
            headerBackgroundColor: Colors.orange,
            headerBackgroundColorOpened: Colors.red,
            header: Text('Colors', style: _headerStyle),
            content: SizedBox(
              child: Column(
                children: productColors
                    .map((color) => FilterCheckbox(
                          text: color,
                        ))
                    .toList(),
              ),
            ),
            contentBorderColor: Colors.transparent),
      ],
    );
  }
}
