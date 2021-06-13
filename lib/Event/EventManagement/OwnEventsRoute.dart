import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';

import '../../globals.dart';
import '../../miscTypes/Event.dart';
import '../../miscWidgets/NavBar.dart';
import 'CreateEventRoute.dart';
import 'ViewEventRoute.dart';

class OwnEventsRoute extends StatelessWidget {
  static const String route = '/events/own';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(AppLocalizations.of(context)!.ownEvents),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          _newEventButton(context),
          _eventList(),
        ]));
  }

  Expanded _eventList() {
    return Expanded(
      child: ValueListenableBuilder<List<PropertyValueNotifier<Event>>>(
          valueListenable: ownEvents,
          builder: (context, status, child) {
            return ListView.builder(
                itemCount: status.length,
                itemBuilder: (context, index) {
                  return _eventTile(context, status, index);
                });
          }),
    );
  }

  Center _eventTile(BuildContext context,
      List<PropertyValueNotifier<Event>> status, int index) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ViewEventRoute.route,
                  arguments: ViewEventRouteArguments(status[index]));
            },
            child: Text(status[index].value.name)));
  }

  ElevatedButton _newEventButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(
              CreateEventRoute.route,
            ),
        child: Text(AppLocalizations.of(context)!.createNewEvent));
  }
}
