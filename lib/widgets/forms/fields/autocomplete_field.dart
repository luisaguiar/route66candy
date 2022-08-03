import 'package:route66candy/constants/controllers.dart';
import 'package:route66candy/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:route66candy/routing/routes.dart';

class AutocompleteField extends StatelessWidget {
  const AutocompleteField({Key? key}) : super(key: key);

  static final List<Product> _productOptions = [
    Product(
        id: 1,
        name: 'Trolli Very Berry Sour Brite Crawlers Gummy Worms Candy Bag',
        description: 'Updated. Lorem ipsum dolor sit amet',
        brand: null,
        category: null,
        image_path: '',
        retail: 6.33,
        weight: null,
        rated_by: null,
        rating: null,
        upc: null),
    Product(
        id: 2,
        name: 'Nerdy Gummy Clusters',
        description:
            'Nerds Gummy Clusters are a combination of flavors and texturestangy, crunchy, sweet, gummy and the poppable, bite-sized portionability. Rainbow Nerds surround fruity, gummy centers. Those sweet little sparks are fantastic inventors. A poppable cluster, packed with tangy, crunchy Nerds. A candy so tasty, there aren\'t even words. Taste the crunchy, gummy, yummy creation is the playful and fun-to-eat candy with a variety of delicious, crunchy, chewy and gummy options: Original including the iconic dual-flavored box, Ropes, Big Chewy and now Gummy Clusters. The original iconic box couples two complementary flavors with dual chambers, allowing candy lovers to pour out perfectly imperfect pieces of pure delight. Ropes give fans a chewy, fruity string packed with crunchy, sweet , and Big Chewy and Sour Big Chewy have a crunch that surrounds a chewy center.',
        brand: 'Nerd',
        category: 'Gummies',
        image_path: 'assets/images/products/Nerd-Gummy-Clusters_web.jpg',
        retail: 3.48,
        weight: '8oz',
        rated_by: 8,
        rating: 3.6,
        upc: 8498149),
    Product(
        id: 3,
        name: 'Airheads Candy Variety Gravity Feed Box',
        description:
            'Nothing beats the tremendously tangy, playfully chewy chew of Airheads candy! Each gravity feed box includes 60 individually wrapped assorted fruit bars. Packed with juicy deliciousness, every bite of these assorted fruit bars will have your taste buds happy!',
        brand: 'Airheads',
        category: 'Candy',
        image_path: 'assets/images/products/airheads.png',
        retail: 7.98,
        weight: '.55 oz',
        rated_by: 45,
        rating: 5,
        upc: 38323273),
    Product(
        id: 4,
        name: 'Starburst Original Fruit Chews Candy Theater Box',
        description:
            'Have you experienced the unexpectedly juicy burst of bold fruit flavor inside every Starburst candy? Treat yourself to the extraordinary juiciness that defines these beloved chewy candies. From Starburst candies right out of the wrapper to Starburst recipes and decorations, there are endless ways to add a burst of juicy flavor every day, including adding them to your next party.',
        brand: 'Starburst',
        category: 'Candy',
        image_path: 'assets/images/products/starburst.png',
        retail: 1.24,
        weight: '3.5oz',
        rated_by: 95,
        rating: 4.7,
        upc: 39168548),
    Product(
        id: 5,
        name: 'Example item',
        description: 'Lorem ipsum dolor sit amet',
        brand: null,
        category: null,
        image_path: '',
        retail: 2.98,
        weight: null,
        rated_by: null,
        rating: null,
        upc: null),
    Product(
        id: 7,
        name: 'Example item 3',
        description: 'Lorem ipsum dolor sit amet',
        brand: null,
        category: null,
        image_path: '',
        retail: 2.98,
        weight: null,
        rated_by: null,
        rating: null,
        upc: null),
  ];

  static String _displayStringForOption(Product option) =>
      '${option.id} - ${option.name}';

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Product>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Product>.empty();
        }

        return _productOptions.where((Product option) => option
            .toString()
            .toLowerCase()
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
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
      onSelected: (Product id) {
        // debugPrint('You just selected ${selection.id}');
        navigationController.navigatTo('$productDetailsPageRoute/$id');
      },
    );
  }
}
