import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Settings/PersonalDataRoute.dart';

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
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.language)),
            //TODO Personal Data
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(PersonalDataRoute.route),
              child: Text(AppLocalizations.of(context)!.personalData),
            ),
            //TODO Internal Workings
            ElevatedButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.internalWorkings))
          ],
        ),
      ),
    );
  }
}
