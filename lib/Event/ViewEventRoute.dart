import 'package:flutter/material.dart';
import 'package:mci_practicum/Event/AddVisitorRoute.dart';

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
    return MaterialApp(
      title: 'Corona EventApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Event ${event.name}'),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Minimale Verweildauer: ${event.minDuration}'),
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
                    child: Text(
                        'Manuelle Teilnehmer: ${event.manualVisitors.length}')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddVisitorRoute(
                                    event: event,
                                    update: () {
                                      setState(() {});
                                    },
                                  )));
                    },
                    child: Text('Manuelle Teilnehmer hinzufügen')),
                //TODO replace with QR Code
                Text('Here should be a QR Code'),
                ElevatedButton(
                    //TODO onPressed shares the QR Code
                    onPressed: () {},
                    child: Text('QR Code teilen')),
              ]))),
    );
  }
}
