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
      FAQElement('Sammelt die CoronaEvent-App meine Daten?', 'Die Corona Event App sammelt nur Ihre nötigsten Daten. Falls Sie die nötigen IT.Kenntnisse haben, können Sie sich im Source-Code darüber vergewissern'),
      FAQElement('Fallen versteckte Kosten an?', 'Nein es fallen keine Kosten an'),
      FAQElement('Sind meine Persöhnlichendaten sicher?', 'Durch eine RSA-Verschlüsslung sind Ihre Daten bei uns sicher '),
      FAQElement('Wie ändere ich die Sprache in meiner App', 'Homescreen --> Menü --> Einstellungen --> Sprache --> Sprache wählen  '),
      FAQElement('Wie erstelle ich ein Event', 'Homescreen --> Events --> Eigene Events --> Neues Event erstellen'),
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
