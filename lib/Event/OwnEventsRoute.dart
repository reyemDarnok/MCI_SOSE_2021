import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../NavBar.dart';
import '../globals.dart';
import 'CreateEventRoute.dart';
import 'ViewEventRoute.dart';

class OwnEventsRoute extends StatefulWidget {
  static const String route = '/ownEvents';

  @override
  State<StatefulWidget> createState() => OwnEventsRouteState();
}

class OwnEventsRouteState extends State<OwnEventsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(title: AppLocalizations.of(context)!.ownEvents),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, CreateEventRoute.route,
                    arguments: CreateEventRouteArguments(() {
                  setState(() {});
                }));
              },
              child: Text(AppLocalizations.of(context)!.createNewEvent)),
          Expanded(
              child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, ViewEventRoute.route,
                                  arguments:
                                      ViewEventRouteArguments(events[index]));
                            },
                            child: Text(events[index].name)));
                  }
              )
            )
          ]
        )
    );
  }
}