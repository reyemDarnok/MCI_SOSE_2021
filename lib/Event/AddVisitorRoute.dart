import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/PersonEntryForm.dart';

import '../NavBar.dart';
import 'Event.dart';

class AddVisitorRoute extends StatelessWidget {
  static const String route = '/ownEvents/addVisitor';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as AddVisitorRouteArguments;
    return Scaffold(
        appBar:
            NavBar(args.event.name + AppLocalizations.of(context)!.addVisitor),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          PersonEntryForm(
            callback: (person) {
              args.event.manualVisitors.add(person);
              args.update();
            },
            submitText: AppLocalizations.of(context)!.add,
          )
        ])));
  }
}

class AddVisitorRouteArguments {
  AddVisitorRouteArguments(this.event, this.update);

  final Event event;
  final VoidCallback update;
}
