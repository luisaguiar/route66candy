import 'package:route66candy/helpers/responsiveness.dart';
import 'package:route66candy/pages/index/index.dart';
import 'package:route66candy/widgets/centered_view/centered_view.dart';
import 'package:route66candy/widgets/footer/footer_main.dart';
import 'package:route66candy/widgets/large_screen.dart';
import 'package:route66candy/widgets/small_screen.dart';
import 'package:route66candy/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: topNavigationBar(context, scaffoldKey),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          child: CenteredView(
            child: Column(
              children: const [
                ResponsiveWidget(
                    largeScreen: LargeScreen(), smallScreen: SmallScreen()),
                FooterMain(),
              ],
            ),
          ),
        ));
  }
}
