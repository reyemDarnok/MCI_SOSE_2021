import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Event/EventManagement/ViewEventRoute.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';

import '../../forms/EventForm.dart';
import '../../globals.dart';
import '../../miscWidgets/NavBar.dart';

class CreateEventRoute extends StatelessWidget {
  static const String route = '/events/own/createEvent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(AppLocalizations.of(context)!.newEvent),
        body: EventForm(
          callback: (event) {
            event.initKeys();
            var notifier = PropertyValueNotifier(event);
            ownEvents.value.insert(0, notifier);
            ownEvents.notifyListeners();
            Navigator.of(context).pop(event);
            Navigator.of(context).pushNamed(ViewEventRoute.route,
                arguments: ViewEventRouteArguments(notifier));
          },
        ));
  }
}
