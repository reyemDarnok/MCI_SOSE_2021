import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Settings/InternalsRoute.dart';
import 'package:mci_practicum/Settings/PersonalDataRoute.dart';
import 'package:mci_practicum/globals.dart';

import '../NavBar.dart';

class SettingsRoute extends StatelessWidget {
  static const String route = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(AppLocalizations.of(context)!.settings),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO Language change
            ElevatedButton(
                onPressed: () {
                  appLocale.value = Locale('de');
                },
                child: Text(AppLocalizations.of(context)!.language)),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(PersonalDataRoute.route),
              child: Text(AppLocalizations.of(context)!.personalData),
            ),
            ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(InternalsRoute.route),
                child: Text(AppLocalizations.of(context)!.internalWorkings))
          ],
        ),
      ),
    );
  }
}
