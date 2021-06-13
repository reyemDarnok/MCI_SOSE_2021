import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Event/EventManagement/OwnEventsRoute.dart';
import 'package:mci_practicum/Event/VisitManagement/ViewVisitedEventsRoute.dart';

import '../miscWidgets/NavBar.dart';

class EventsRoute extends StatelessWidget {
  static const String route = '/events';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(AppLocalizations.of(context)!.events),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(ViewVisitedEventsRoute.route),
                child: Text(AppLocalizations.of(context)!.visitedEvents)),
            ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(OwnEventsRoute.route),
                child: Text(AppLocalizations.of(context)!.ownEvents))
          ],
        )));
  }
}
