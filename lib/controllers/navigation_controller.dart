import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Local navigator that will allow us to change routes
///
///
class NavigationController extends GetxController {
  static NavigationController instance = Get.find();

  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  /// Method that allows us to change screen
  ///
  Future<dynamic> navigatTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  /// Method that allows us going back to the previous page
  ///
  goBack() => navigationKey.currentState!.pop();
}
