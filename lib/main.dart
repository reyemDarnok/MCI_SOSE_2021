import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Event/EventManagement/CreateEventRoute.dart';
import 'package:mci_practicum/Event/EventManagement/OwnEventsRoute.dart';
import 'package:mci_practicum/Event/EventManagement/ViewEventRoute.dart';
import 'package:mci_practicum/Event/EventsRoute.dart';
import 'package:mci_practicum/Event/VisitManagement/AddVisitorRoute.dart';
import 'package:mci_practicum/Event/VisitManagement/ViewEventVisit.dart';
import 'package:mci_practicum/Event/VisitManagement/ViewPersonRoute.dart';
import 'package:mci_practicum/Event/VisitManagement/ViewVisitedEventsRoute.dart';
import 'package:mci_practicum/Event/VisitManagement/ViewVisitorsRoute.dart';
import 'package:mci_practicum/FAQ/FAQRoute.dart';
import 'package:mci_practicum/Settings/InternalsRoute.dart';
import 'package:mci_practicum/Settings/PersonalDataRoute.dart';
import 'package:mci_practicum/Settings/SettingsRoute.dart';
import 'package:mci_practicum/TestEntryRoute.dart';
import 'package:mci_practicum/globals.dart';

import 'MainRoute.dart';

void main() {
  log.i('Initializing App');
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
    FAQRoute.route: (context) => FAQRoute(),
    SelectDurationRoute.route: (context) => SelectDurationRoute(),
    EventsRoute.route: (context) => EventsRoute(),
    ViewVisitedEventsRoute.route: (context) => ViewVisitedEventsRoute(),
    ViewEventVisitRoute.route: (context) => ViewEventVisitRoute()
  };
  runApp(ValueListenableBuilder<Locale?>(
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
