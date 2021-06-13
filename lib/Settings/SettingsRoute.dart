import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Settings/InternalsRoute.dart';
import 'package:mci_practicum/Settings/PersonalDataRoute.dart';
import 'package:mci_practicum/globals.dart';

import '../miscWidgets/NavBar.dart';

class SettingsRoute extends StatelessWidget {
  static const String route = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(AppLocalizations.of(context)!.settings),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _languageButton(context),
            _personalDataButton(context),
            _internalsButton(context)
          ],
        ),
      ),
    );
  }

  ElevatedButton _internalsButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(InternalsRoute.route),
        child: Text(AppLocalizations.of(context)!.internalWorkings));
  }

  ElevatedButton _personalDataButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pushNamed(PersonalDataRoute.route),
      child: Text(AppLocalizations.of(context)!.personalData),
    );
  }

  ElevatedButton _languageButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _showLanguageDialog(context);
        },
        child: Text(AppLocalizations.of(context)!.language));
  }

  void _showLanguageDialog(BuildContext context) {
    var supportedLocales = [
      {'locale': Locale('de'), 'name': 'Deutsch'},
      {'locale': Locale('en', 'US'), 'name': 'English (US)'},
      {'locale': Locale('en', 'GB'), 'name': 'English (UK)'}
    ];
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text(AppLocalizations.of(context)!.selectLanguage),
              children: [
                //TODO Loop -> ListView, maybe?
                _localeButton(context, supportedLocales[0]),
                _localeButton(context, supportedLocales[1]),
                _localeButton(context, supportedLocales[2])
              ],
            ));
  }

  TextButton _localeButton(BuildContext context, Map<String, Object> locale) {
    return TextButton(
        onPressed: () {
          appLocale.value = locale['locale'] as Locale;
          log.i(
              "Changed locale to ${(locale['locale'] as Locale).toLanguageTag()}");
          Navigator.of(context).pop();
        },
        child: Text(locale['name'].toString()));
  }
}
