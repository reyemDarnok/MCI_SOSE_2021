import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/forms/PersonEntryForm.dart';

import '../globals.dart';
import '../miscWidgets/NavBar.dart';

class PersonalDataRoute extends StatelessWidget {
  static const String route = '/settings/personalData';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(AppLocalizations.of(context)!.personalData),
        body: Center(
            child: PersonEntryForm(
          callback: (person) {
            me.value = person;
            log.i('Changed personal data to ${me.value.toJson()}');
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(AppLocalizations.of(context)!
                          .personalDataChangedTitle),
                      content: Text(AppLocalizations.of(context)!
                          .personalDataChangedContent),
                    ));
          },
          submitText: AppLocalizations.of(context)!.save,
          defaultPerson: me.value,
        )));
  }
}
