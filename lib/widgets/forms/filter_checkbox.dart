import 'package:route66candy/constants/controllers.dart';
import 'package:route66candy/routing/routes.dart';
import 'package:flutter/material.dart';

class FilterCheckbox extends StatefulWidget {
  final String text;
  const FilterCheckbox({Key? key, required this.text}) : super(key: key);

  @override
  State<FilterCheckbox> createState() => _FilterCheckboxState(category: text);
}

class _FilterCheckboxState extends State<FilterCheckbox> {
  final String category;
  bool isChecked = false;

  _FilterCheckboxState({required this.category});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked,
            onChanged: (bool? value) {
              navigationController.navigatTo('$categoriesPageRoute/$category');
              // setState(() {
              //   isChecked = value!;
              // });
            },
          ),
          Text(
            widget.text,
          ),
        ], //<Widget>[]
      ),
    );
  }
}
