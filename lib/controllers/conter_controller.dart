import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs; // obs makes the int an observable

  void increment() {
    counter++;
  }
}
