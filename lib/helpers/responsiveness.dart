import 'dart:html';
import 'package:flutter/material.dart';

///
const int largeScreenSize = 1366;

///
const int mediumScreenSize = 768;

///
const int smallScreenSize = 360;

///
const int customScreenSize = 1100; // not needed for every single proyect

///
///
///
///
class ResponsiveWidget extends StatelessWidget {
  ///
  final Widget largeScreen;

  ///
  final Widget? mediumScreen;

  ///
  final Widget? smallScreen;

  /// Class constructor.
  ///
  ///
  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  ///
  ///
  ///
  static bool isSmallScreen(BuildContext context) {
    final currentScreenSize = MediaQuery.of(context).size.width;

    return currentScreenSize < mediumScreenSize;
  }

  ///
  ///
  ///
  static bool isMediumScreen(BuildContext context) {
    final currentScreenSize = MediaQuery.of(context).size.width;

    return currentScreenSize >= mediumScreenSize &&
        currentScreenSize < largeScreenSize;
  }

  ///
  ///
  ///
  static bool isLargeScreen(BuildContext context) {
    final currentScreenSize = MediaQuery.of(context).size.width;

    return currentScreenSize >= largeScreenSize;
  }

  ///
  ///
  ///
  static bool isCustomScreen(BuildContext context) {
    final currentScreenSize = MediaQuery.of(context).size.width;

    return currentScreenSize >= mediumScreenSize &&
        currentScreenSize <= customScreenSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;

      if (_width >= largeScreenSize) {
        return largeScreen;
      } else if (_width < largeScreenSize && _width >= mediumScreenSize) {
        return mediumScreen ?? largeScreen;
      } else {
        return smallScreen ?? largeScreen;
      }
    });
  }
}
