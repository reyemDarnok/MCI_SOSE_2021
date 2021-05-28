import 'package:flutter/material.dart';
import 'package:mci_practicum/Person.dart';

import 'Event.dart';

class ViewVisitorsRoute extends StatelessWidget {
  ViewVisitorsRoute({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    event.manualVisitors.add(new Person(
        name: 'name', telephone: 'telephone', street: 'street', city: 'city'));
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
                                  //TODO implement noop to show person
                                  onPressed: () {},
                                  child:
                                      Text(event.manualVisitors[index].name));
                            }))),
                ElevatedButton(
                  //TODO implement navigation to Person view
                  onPressed: () {},
                  child: Text('Manuellen Teilnehmer hinzufügen'),
                ),
              ]))),
    );
  }
}
