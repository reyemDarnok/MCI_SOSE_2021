import 'package:flutter/material.dart';

import 'AddVisitorRoute.dart';
import 'Event.dart';
import 'ViewPersonRoute.dart';

class ViewVisitorsRoute extends StatelessWidget {
  ViewVisitorsRoute({Key? key, required this.event}) : super(key: key);
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
                            builder: (context) =>
                                //TODO make Stateful to do update
                                AddVisitorRoute(
                                  event: event,
                                  update: () {},
                                )));
                  },
                  child: Text('Manuellen Teilnehmer hinzufügen'),
                ),
              ]))),
    );
  }
}
