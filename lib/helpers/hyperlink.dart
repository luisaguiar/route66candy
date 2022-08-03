import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hyperlink extends StatelessWidget {
  final Uri _url = Uri.parse('https://flutter.dev');

  Hyperlink({Key? key}) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bodyTextStyle =
        textTheme.bodyText1!.apply(color: colorScheme.onPrimary);

    const name = 'Flutter Gallery'; // Don't need to localize.
    const legalese = '© 2021 The Flutter team'; // Don't need to localize.
    // final repoLinkIndex = seeSource.indexOf(repoText);
    // final repoLinkIndexEnd = repoLinkIndex + repoText.length;
    // final seeSourceFirst = seeSource.substring(0, repoLinkIndex);
    // final seeSourceSecond = seeSource.substring(repoLinkIndexEnd);

    return Center(
      child: ElevatedButton(
        onPressed: _launchUrl,
        child: Text('Show Flutter homepage'),
      ),
    );
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
          style: bodyTextStyle,
          text: 'seeSourceFirst',
        ),
        TextSpan(
          style: bodyTextStyle.copyWith(
            color: colorScheme.primary,
          ),
          text: 'repoText',
          recognizer: TapGestureRecognizer()..onTap = () => _launchUrl,
        ),
        TextSpan(
          style: bodyTextStyle,
          text: 'seeSourceSecond',
        ),
      ],
    ));
  }
}
