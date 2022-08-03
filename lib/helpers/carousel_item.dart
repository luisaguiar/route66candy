import 'package:flutter/cupertino.dart';

///
///
///
///
class CarouselItem {
  final String imagePath;
  final Widget? widget;
  final bool blurImage;

  CarouselItem(
      {Key? key, required this.imagePath, this.widget, this.blurImage = false});
}
