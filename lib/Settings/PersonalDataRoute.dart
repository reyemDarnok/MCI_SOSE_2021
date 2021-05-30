import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/PersonEntryForm.dart';

import '../NavBar.dart';
import '../globals.dart';

class PersonalDataRoute extends StatelessWidget {
  static const String route = '/settings/personalData';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(AppLocalizations.of(context)!.personalData),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          PersonEntryForm(
            callback: (person) {
              me = person;
            },
            submitText: AppLocalizations.of(context)!.save,
            defaultPerson: me,
          )
        ])));
  }
}
