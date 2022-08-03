import 'package:route66candy/controllers/conter_controller.dart';
import 'package:route66candy/controllers/screens.dart/other.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  //  Using Get.put to register our controllers
  final CounterController counterController = Get.put(CounterController());

  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Clicks: ${counterController.counter.value}')),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => OtherScreen());
                    },
                    child: const Text('Open other screen')),
              )
            ],
          ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterController.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
