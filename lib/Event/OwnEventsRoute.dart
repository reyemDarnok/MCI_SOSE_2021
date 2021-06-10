import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';

import '../NavBar.dart';
import '../globals.dart';
import 'CreateEventRoute.dart';
import 'Event.dart';
import 'ViewEventRoute.dart';

class OwnEventsRoute extends StatelessWidget {
  static const String route = '/ownEvents';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(AppLocalizations.of(context)!.ownEvents),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(
                    CreateEventRoute.route,
                  ),
              child: Text(AppLocalizations.of(context)!.createNewEvent)),
          Expanded(
            child: ValueListenableBuilder<List<PropertyValueNotifier<Event>>>(
                valueListenable: ownEvents,
                builder: (context, status, child) {
                  return ListView.builder(
                      itemCount: status.length,
                      itemBuilder: (context, index) {
                        return Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      ViewEventRoute.route,
                                      arguments: ViewEventRouteArguments(
                                          status[index]));
                                },
                                child: Text(status[index].value.name)));
                      });
                }),
          ),
        ]));
  }
}
