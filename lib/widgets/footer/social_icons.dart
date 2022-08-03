import 'package:route66candy/models/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route66candy/constants/style.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SocialIcon> socials = [
      SocialIcon(
          name: 'Facebook',
          icon: FontAwesomeIcons.facebook,
          url: 'http://facebook.com'),
      SocialIcon(
          name: 'Twitter',
          icon: FontAwesomeIcons.twitter,
          url: 'http://twitter.com'),
      SocialIcon(
          name: 'Instagram',
          icon: FontAwesomeIcons.instagram,
          url: 'http://instagram.com'),
      SocialIcon(name: 'Share', icon: FontAwesomeIcons.shareNodes, url: ''),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: socials
          .map((social) => Row(
                children: [
                  FaIcon(
                    social.icon,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ))
          .toList(),
    );
  }
}
