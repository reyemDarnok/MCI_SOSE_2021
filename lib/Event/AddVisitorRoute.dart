import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          title: Text(event.name + AppLocalizations.of(context)!.addVisitor),
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
