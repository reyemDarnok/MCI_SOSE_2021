import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/FAQ/FAQElement.dart';

import '../miscWidgets/NavBar.dart';

//TODO Questions and answers
class FAQRoute extends StatelessWidget {
  static const String route = '/faq';

  @override
  Widget build(BuildContext context) {
    var faqElements = [
      FAQElement(AppLocalizations.of(context)!.faqQuestion1,
          AppLocalizations.of(context)!.faqAnswer1),
      FAQElement(AppLocalizations.of(context)!.faqQuestion2,
          AppLocalizations.of(context)!.faqAnswer2),
      FAQElement(AppLocalizations.of(context)!.faqQuestion3,
          AppLocalizations.of(context)!.faqAnswer3),
      FAQElement(AppLocalizations.of(context)!.faqQuestion4,
          AppLocalizations.of(context)!.faqAnswer4),
      FAQElement(AppLocalizations.of(context)!.faqQuestion5,
          AppLocalizations.of(context)!.faqAnswer5),
      FAQElement(AppLocalizations.of(context)!.faqQuestion6,
          AppLocalizations.of(context)!.faqAnswer6),
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
