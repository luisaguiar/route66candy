import 'package:route66candy/controllers/navigation_controller.dart';
import 'package:route66candy/layout.dart';
import 'package:route66candy/pages/404.dart';
import 'package:route66candy/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  /// Register our navition controller
  Get.put(NavigationController());

  ///
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Route66Candy',
      initialRoute: shopPageRoute,
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(
          name: '/not-found',
          page: () => const PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(
          name: shopPageRoute,
          page: () => SiteLayout(),
        ),
      ],
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: Colors.pink),
      // home: SiteLayout(),
    );
  }
}
