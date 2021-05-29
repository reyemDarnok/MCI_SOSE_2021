import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'AddVisitorRoute.dart';
import 'Event.dart';
import 'ViewVisitorsRoute.dart';

class ViewEventRoute extends StatefulWidget {
  ViewEventRoute({Key? key, required this.event});

  final Event event;

  @override
  State<StatefulWidget> createState() => ViewEventRouteState(event: event);
}

class ViewEventRouteState extends State<ViewEventRoute> {
  ViewEventRouteState({required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(event.name),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          Text(AppLocalizations.of(context)!.minDurationLabel +
              event.minDuration.toString()),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewVisitorsRoute(
                            event: event,
                            update: () {
                              setState(() {});
                            })));
              },
              child: Text(AppLocalizations.of(context)!.manualVisitorsLabel +
                  event.manualVisitors.length.toString())),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddVisitorRoute(
                              event: event,
                              update: () {
                                setState(() {});
                              },
                            )));
              },
              child: Text(AppLocalizations.of(context)!.addManualVisitors)),
          //TODO replace with QR Code
          Text('Here should be a QR Code'),
          ElevatedButton(
              //TODO onPressed shares the QR Code
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.shareQRCode)),
        ])));
  }
}
