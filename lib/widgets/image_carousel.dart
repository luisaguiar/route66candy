import 'package:carousel_slider/carousel_slider.dart';
import 'package:route66candy/helpers/carousel_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';

class ImageCarousel extends StatelessWidget {
  final List<CarouselItem> carouselItems;
  const ImageCarousel({Key? key, required this.carouselItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 300,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final Image image = Image.asset(
            carouselItems[index].imagePath,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          );

          return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(color: Colors.amber),
              child: Stack(children: [
                Container(
                  alignment: Alignment.center,
                  child: carouselItems[index].blurImage
                      ? ClipRRect(
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: image,
                          ),
                        )
                      : image,
                ),
                Container(
                  alignment: Alignment.center,
                  child: carouselItems[index].widget,
                ),
              ]));
        },
        itemCount: carouselItems.length,
      ),
    );
  }
}
