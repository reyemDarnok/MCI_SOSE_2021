import 'package:flutter/material.dart';
import 'package:mci_practicum/PersonEntryForm.dart';

import 'Event.dart';

class AddVisitorRoute extends StatelessWidget {
  AddVisitorRoute({Key? key, required this.event, required this.update})
      : super(key: key);
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
          title: Text('Event ${event.name} - Teilnehmer hinzufügen'),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          PersonEntryForm(callback: (person) {
            event.manualVisitors.add(person);
            update();
          })
        ])));
  }
}
