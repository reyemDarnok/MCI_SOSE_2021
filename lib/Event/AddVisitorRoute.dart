import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/PersonEntryForm.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';

import '../NavBar.dart';
import 'Event.dart';

class AddVisitorRoute extends StatelessWidget {
  static const String route = '/ownEvents/addVisitor';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as AddVisitorRouteArguments;
    return Scaffold(
        appBar: NavBar(
            AppLocalizations.of(context)!.addVisitor(args.event.value.name)),
        body: Center(
            child:
                Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              PersonEntryForm(
                callback: (person) {
                  args.event.value.manualVisitors.add(person);
                  args.event.notifyListeners();
                  Navigator.of(context).pop();
                },
                submitText: AppLocalizations.of(context)!.add,
              )
            ])));
  }
}

class AddVisitorRouteArguments {
  AddVisitorRouteArguments(this.event);

  final PropertyValueNotifier<Event> event;
}
