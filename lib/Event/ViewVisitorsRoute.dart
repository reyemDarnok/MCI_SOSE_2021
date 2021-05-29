import 'package:flutter/material.dart';

import 'AddVisitorRoute.dart';
import 'Event.dart';
import 'ViewPersonRoute.dart';

class ViewVisitorsRoute extends StatefulWidget {
  ViewVisitorsRoute({Key? key, required this.event, required this.update})
      : super(key: key);
  final Event event;
  final VoidCallback update;

  @override
  State<StatefulWidget> createState() =>
      ViewVisitorsRouteState(event: event, update: update);
}

class ViewVisitorsRouteState extends State<ViewVisitorsRoute> {
  ViewVisitorsRouteState({required this.event, required this.update});

  final Event event;
  final VoidCallback update;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Event ${event.name}'),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Manuell hinzugefügte Teilnehmer'),
                Expanded(
                    child: Center(
                        child: ListView.builder(
                            itemCount: event.manualVisitors.length,
                            itemBuilder: (context, index) {
                              return ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewPersonRoute(
                                                  person: event
                                                      .manualVisitors[index],
                                                )));
                                  },
                                  child:
                                      Text(event.manualVisitors[index].name));
                            }))),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddVisitorRoute(
                            event: event,
                            update: () {
                              setState(() {});
                              update();
                            },
                          )));
            },
            child: Text('Manuellen Teilnehmer hinzufügen'),
          ),
        ])));
  }
}
