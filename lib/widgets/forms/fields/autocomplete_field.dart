import 'package:route66candy/controllers/product_autocomple.dart';
import 'package:route66candy/models/product/product.dart';
import 'package:flutter/material.dart';

///
///
///
///
class AutocompleteField extends StatelessWidget {
  const AutocompleteField({Key? key}) : super(key: key);

  static String _displayStringForOption(Product option) => option.name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: BackendService.getProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // <List<Map<String, String>>>
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: Text('Please wait while it\'s loading...'));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final products = snapshot.data;

          return Autocomplete<Product>(
            displayStringForOption: _displayStringForOption,
            optionsBuilder: (TextEditingValue textEditingValue) {
              // if (textEditingValue.text == '') {
              //   return const Iterable<Product>.empty();
              // }
              return products.where((Product product) => product
                  .toString()
                  .contains(textEditingValue.text.toLowerCase()));
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                VoidCallback onFieldSubmitted) {
              return SizedBox(
                height: 34,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search our store...',
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.pink),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  style: const TextStyle(color: Colors.pink),
                ),
              );
            },
            // onSelected: (Product selection) {
            //   debugPrint(
            //       'You just selected ${_displayStringForOption(selection)}');
            // },
          );
        }

        return const CircularProgressIndicator(
          color: Colors.pink,
          strokeWidth: 1,
        ); // displays while loading data
      },
    );

    // return Autocomplete<User>(
    //   displayStringForOption: _displayStringForOption,
    //   optionsBuilder: (TextEditingValue textEditingValue) {
    //     if (textEditingValue.text == '') {
    //       return const Iterable<User>.empty();
    //     }
    //     return _userOptions.where((User option) {
    //       return option
    //           .toString()
    //           .contains(textEditingValue.text.toLowerCase());
    //     });
    //   },
    //   fieldViewBuilder: (BuildContext context,
    //       TextEditingController fieldTextEditingController,
    //       FocusNode fieldFocusNode,
    //       VoidCallback onFieldSubmitted) {
    //     return SizedBox(
    //       height: 34,
    //       child: TextField(
    //         decoration: InputDecoration(
    //           filled: true,
    //           fillColor: Colors.white,
    //           hintText: 'Search our store...',
    //           contentPadding: const EdgeInsets.all(10),
    //           border:
    //               OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    //           focusedBorder: OutlineInputBorder(
    //               borderSide: const BorderSide(color: Colors.pink),
    //               borderRadius: BorderRadius.circular(30)),
    //         ),
    //         controller: fieldTextEditingController,
    //         focusNode: fieldFocusNode,
    //         style: const TextStyle(color: Colors.pink),
    //       ),
    //     );
    //   },
    //   onSelected: (User selection) {
    //     debugPrint('You just selected ${_displayStringForOption(selection)}');
    //   },
    // );
  }
}
