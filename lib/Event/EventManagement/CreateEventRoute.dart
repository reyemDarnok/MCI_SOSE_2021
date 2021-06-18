import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            ownEvents.value.add(PropertyValueNotifier(event));
            ownEvents.notifyListeners();
            Navigator.of(context).pop(event);
          },
        ));
  }
}
