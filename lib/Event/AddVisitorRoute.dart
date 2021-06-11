import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Event/PersonVisit.dart';
import 'package:mci_practicum/PersonEntryForm.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';

import '../NavBar.dart';
import '../Person.dart';
import '../utils.dart';
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
                  Navigator.of(context).pushNamed(SelectDurationRoute.route,
                      arguments:
                          SelectDurationRouteArguments(args.event, person));
                },
                submitText: AppLocalizations.of(context)!.add,
              )
            ])));
  }
}

class SelectDurationRoute extends StatelessWidget {
  static const String route = '/ownEvents/addVisitor/selectDuration';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as SelectDurationRouteArguments;
    //TODO remove hacky solution
    TextEditingController estimatedDuration = TextEditingController(
        text: args.event.value.minDuration.inHours.toString() + 'h');
    return Scaffold(
        appBar: NavBar(
            AppLocalizations.of(context)!.addVisitor(args.event.value.name)),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              _estimatedDurationFormField(context, estimatedDuration),
              _confirmButton(estimatedDuration, args.event, args, context)
            ])));
  }

  TextFormField _estimatedDurationFormField(
      BuildContext context, TextEditingController estimatedDuration) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.estimatedDurationLabel,
          hintText: AppLocalizations.of(context)!.estimatedDurationHintText),
      controller: estimatedDuration,
      validator: (content) {
        if (content == null || content.isEmpty) {
          return null;
        }
        try {
          parseDuration(content);
        } on FormatException {
          return AppLocalizations.of(context)!.estimatedDurationMalformedError;
        }
      },
    );
  }

  ElevatedButton _confirmButton(
      TextEditingController estimatedDuration,
      PropertyValueNotifier<Event> event,
      SelectDurationRouteArguments args,
      BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Duration d = parseDuration(estimatedDuration.text);
          event.value.manualVisitors.add(PropertyValueNotifier(PersonVisit(
              person: args.person, startTime: DateTime.now(), duration: d)));
          event.notifyListeners();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        child: Text(AppLocalizations.of(context)!.confirm));
  }
}

class SelectDurationRouteArguments {
  SelectDurationRouteArguments(this.event, this.person);

  final PropertyValueNotifier<Event> event;
  final Person person;
}

class AddVisitorRouteArguments {
  AddVisitorRouteArguments(this.event);

  final PropertyValueNotifier<Event> event;
}
