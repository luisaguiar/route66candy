import 'package:route66candy/constants/style.dart';
import 'package:route66candy/helpers/responsiveness.dart';
import 'package:route66candy/widgets/forms/fields/autocomplete_field.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:route66candy/widgets/user/user_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart';

///
/// context to know in which widget we are going to build the appbar
/// Scaffold key is used when, for example, opening the drawer
///
AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  /// Location of the main app logo
  const String LOGO_PATH = 'assets/images/logo.png';

  return AppBar(
    elevation: 2,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: dark),
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14),
                child: Image.asset(
                  LOGO_PATH,
                  width: 40,
                ),
              ),
            ],
          )
        : IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              key.currentState!.openDrawer();
            },
          ),
    title: Row(
      children: [
        const Visibility(
            child: CustomText(
          text: 'Route66Candy',
          color: Colors.pink,
          size: 20,
          weight: FontWeight.bold,
        )),
        Expanded(child: Container()),
        const SizedBox(
          width: 400,
          child: AutocompleteField(),
        ),
        const SizedBox(
          width: 24,
        ),
        Container(
          child: SizedBox(
            width: 100,
            height: 40,
            child: FittedBox(
              child: FloatingActionButton.extended(
                label: const Text('Build Your Own'),
                backgroundColor: const Color.fromARGB(255, 231, 72, 165),
                onPressed: () {
                  // TODO:: Navigate to builder page
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SecondRoute()),
                  // );
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        const SizedBox(
          width: 16,
        ),
        UserMenu(),
        Stack(
          children: [
            Badge(
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              badgeColor: Color.fromARGB(255, 231, 72, 165),
              child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.bagShopping,
                    size: 20,
                    color: dark,
                  )),
            ),
          ],
        )
      ],
    ),
  );
}
