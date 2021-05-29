import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../globals.dart';
import 'CreateEventRoute.dart';
import 'ViewEventRoute.dart';

class OwnEventsRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OwnEventsRouteState();
}

class OwnEventsRouteState extends State<OwnEventsRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(AppLocalizations.of(context)!.ownEvents),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateEventRoute(
                              update: () {
                                setState(() {});
                              },
                            )));
              },
              child: Text(AppLocalizations.of(context)!.createNewEvent)),
          Expanded(
              child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewEventRoute(
                                          event: events[index])));
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