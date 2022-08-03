import 'package:route66candy/pages/categories/categories.dart';
import 'package:route66candy/pages/index/index.dart';
import 'package:route66candy/pages/products/products.dart';
import 'package:route66candy/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Return a page route
Route<dynamic> generateRoute(RouteSettings settings) {
  print('Settings.Name:: ${settings.name}');
  switch (settings.name) {
    case shopPageRoute:
      return _getPageRoute(const IndexPage());

    case categoriesPageRoute:
      return _getPageRoute(const CategoriesPage(category: 'Candy'));

    case productDetailsPageRoute:
      return _getPageRoute(const ProductsPage(id: 1));

    default:
      return _getPageRoute(const IndexPage());
  }
}

/// Returns a page route
PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
