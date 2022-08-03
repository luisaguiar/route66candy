import 'package:route66candy/helpers/carousel_item.dart';
import 'package:route66candy/widgets/image_carousel.dart';
import 'package:flutter/material.dart';

import '../forms/signup_promo.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageCarousel(
      carouselItems: [
        CarouselItem(
            imagePath:
                'assets/images/promo/pexels-karolina-grabowska-4016509.jpg',
            widget: const SignupPromo(),
            blurImage: true),
        CarouselItem(
            imagePath: 'assets/images/promo/pexels-tim-mossholder-942320.jpg',
            widget: const Text('asd')),
        CarouselItem(
          imagePath: 'assets/images/promo/promo1.png',
        ),
      ],
    );
  }
}
