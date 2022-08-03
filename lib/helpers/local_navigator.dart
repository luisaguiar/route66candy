import 'package:route66candy/constants/controllers.dart';
import 'package:route66candy/pages/categories/categories.dart';
import 'package:route66candy/pages/products/products.dart';
import 'package:route66candy/routing/router.dart';
import 'package:route66candy/routing/routes.dart';
import 'package:route66candy/widgets/products/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: shopPageRoute,
      // onGenerateRoute: generateRoute,

      // Provide a function to handle named routes.
      // Use this function to identify the named
      // route being pushed, and create the correct
      // Screen.
      onGenerateRoute: (settings) {
        String routeName;

        if (settings.name!.startsWith('/products')) {
          routeName = '/products';
        } else if (settings.name!.startsWith('/categories')) {
          routeName = '/categories';
        } else {
          routeName = settings.name ?? '';
        }

        if (routeName == productDetailsPageRoute) {
          // Shouldn't be using `!` here, instead I should throw an error
          // or navigate to the shop page
          final List<String> routeArr = settings.name!.split('/');
          final int id = int.parse(routeArr[routeArr.length - 1]);

          return MaterialPageRoute(
            builder: (context) {
              return ProductsPage(id: id);
            },
          );
        } else if (routeName == categoriesPageRoute) {
          final List<String> routeArr = settings.name!.split('/');
          final String category = routeArr[routeArr.length - 1];

          return MaterialPageRoute(
            builder: (context) {
              return CategoriesPage(category: category);
            },
          );
        }

        return generateRoute(settings);
      },
    );
