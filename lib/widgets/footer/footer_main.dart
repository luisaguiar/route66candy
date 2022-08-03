import 'package:route66candy/helpers/hyperlink.dart';
import 'package:route66candy/models/link_data.dart';
import 'package:route66candy/widgets/footer/links_column.dart';
import 'package:route66candy/widgets/footer/newsletter.dart';
import 'package:route66candy/widgets/footer/social_icons.dart';
import 'package:route66candy/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route66candy/constants/style.dart';

///
///
///
///
class FooterMain extends StatelessWidget {
  const FooterMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    final List<LinkData> companyLinks = [
      LinkData(name: 'About', url: '/about'),
      LinkData(name: 'Contact Us', url: '/contact'),
      LinkData(name: 'Legal', url: '/legal'),
      LinkData(name: 'Privacy Policy', url: '/privacy'),
      LinkData(name: 'Terms of Service', url: '/tos'),
    ];

    final List<LinkData> miscLinks = [
      LinkData(name: 'FAQ', url: '/faq'),
      LinkData(name: 'Support', url: '/support'),
      LinkData(name: 'Shipping', url: '/shipping'),
    ];

    final List<LinkData> healthLinks = [
      LinkData(name: 'COVID-19 Handling', url: '/covid'),
      LinkData(name: 'Allergen Info', url: '/allergen'),
    ];

    return Container(
      height: 200,
      width: _width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.pink.withOpacity(.8),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: light, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinksColumn(
                    title: 'Company',
                    links: companyLinks,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  LinksColumn(
                    title: 'Miscellaneous',
                    links: miscLinks,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  LinksColumn(
                    title: 'Health',
                    links: healthLinks,
                  ),
                ],
              ),
              const SizedBox(height: 56),
              Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.copyright,
                    size: 10,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: 'Route 66 Candy Americana',
                    color: Colors.white,
                    size: 10,
                  )
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Newsletter(),
              SocialIcons(),
            ],
          ),
        ],
      ),
    );
  }
}
