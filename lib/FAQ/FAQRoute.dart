import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/FAQ/FAQElement.dart';

import '../NavBar.dart';

//TODO Questions and answers
class FAQRoute extends StatelessWidget {
  static const String route = '/faq';

  @override
  Widget build(BuildContext context) {
    var faqElements = [
      FAQElement('question',
          'Long answer. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.')
    ];
    return Scaffold(
      appBar: NavBar(AppLocalizations.of(context)!.faq),
      body: Center(
        child: ListView.builder(
          itemCount: faqElements.length,
          itemBuilder: (BuildContext context, int index) {
            return faqElements[index];
          },
        ),
      ),
    );
  }
}
