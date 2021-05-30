import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Event/AddVisitorRoute.dart';
import 'package:mci_practicum/Event/CreateEventRoute.dart';
import 'package:mci_practicum/Event/OwnEventsRoute.dart';
import 'package:mci_practicum/Event/ViewEventRoute.dart';
import 'package:mci_practicum/Event/ViewPersonRoute.dart';
import 'package:mci_practicum/Event/ViewVisitorsRoute.dart';
import 'package:mci_practicum/Settings/PersonalDataRoute.dart';
import 'package:mci_practicum/Settings/SettingsRoute.dart';
import 'package:mci_practicum/TestEntryRoute.dart';

import 'MainRoute.dart';

void main() {
  runApp(MaterialApp(
    title: 'Corona EventApp',
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    initialRoute: MainRoute.route,
    routes: {
      MainRoute.route: (context) => MainRoute(),
      AddVisitorRoute.route: (context) => AddVisitorRoute(),
      CreateEventRoute.route: (context) => CreateEventRoute(),
      OwnEventsRoute.route: (context) => OwnEventsRoute(),
      ViewEventRoute.route: (context) => ViewEventRoute(),
      ViewPersonRoute.route: (context) => ViewPersonRoute(),
      ViewVisitorsRoute.route: (context) => ViewVisitorsRoute(),
      SettingsRoute.route: (context) => SettingsRoute(),
      TestEntryRoute.route: (context) => TestEntryRoute(),
      PersonalDataRoute.route: (context) => PersonalDataRoute()
    },
  ));
}
