import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Event/AddVisitorRoute.dart';
import 'package:mci_practicum/Event/CreateEventRoute.dart';
import 'package:mci_practicum/Event/OwnEventsRoute.dart';
import 'package:mci_practicum/Event/ViewEventRoute.dart';
import 'package:mci_practicum/Event/ViewPersonRoute.dart';
import 'package:mci_practicum/Event/ViewVisitorsRoute.dart';
import 'package:mci_practicum/FAQ/FAQRoute.dart';
import 'package:mci_practicum/Settings/InternalsRoute.dart';
import 'package:mci_practicum/Settings/PersonalDataRoute.dart';
import 'package:mci_practicum/Settings/SettingsRoute.dart';
import 'package:mci_practicum/TestEntryRoute.dart';
import 'package:mci_practicum/globals.dart';

import 'MainRoute.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() async {
  log = await getLogger();
  log.i('Initializing App');
  configureApp();
  var routes = {
    MainRoute.route: (context) => MainRoute(),
    AddVisitorRoute.route: (context) => AddVisitorRoute(),
    CreateEventRoute.route: (context) => CreateEventRoute(),
    OwnEventsRoute.route: (context) => OwnEventsRoute(),
    ViewEventRoute.route: (context) => ViewEventRoute(),
    ViewPersonRoute.route: (context) => ViewPersonRoute(),
    ViewVisitorsRoute.route: (context) => ViewVisitorsRoute(),
    SettingsRoute.route: (context) => SettingsRoute(),
    TestEntryRoute.route: (context) => TestEntryRoute(),
    PersonalDataRoute.route: (context) => PersonalDataRoute(),
    InternalsRoute.route: (context) => InternalsRoute(),
    FAQRoute.route: (context) => FAQRoute()
  };
  runApp(ValueListenableBuilder<Locale>(
      valueListenable: appLocale,
      builder: (context, status, child) {
        return MaterialApp(
            title: 'Corona EventApp',
            locale: status,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            initialRoute: MainRoute.route,
            routes: routes);
      }));
}
