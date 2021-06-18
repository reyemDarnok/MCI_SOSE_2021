import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';
import 'package:mci_practicum/forms/PersonEntryForm.dart';
import 'package:mci_practicum/miscTypes/PersonVisit.dart';
import 'package:mci_practicum/miscWidgets/GenericButton.dart';

import '../../miscTypes/AuthorisedEvent.dart';
import '../../miscTypes/Person.dart';
import '../../miscWidgets/NavBar.dart';

class AddVisitorRoute extends StatelessWidget {
  static const String route = '/events/own/addVisitor';

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as AddVisitorRouteArguments;
    return Scaffold(
        appBar: NavBar(
            AppLocalizations.of(context)!.addVisitor(args.event.value.name)),
        body: Center(
            child: Column(
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
    //TODO localization ?
    TextEditingController estimatedDuration = TextEditingController(
        text: prettyDuration(args.event.value.minDuration,
            abbreviated: true, locale: DurationLocale.fromLanguageCode('en')!));
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

  SizedBox _estimatedDurationFormField(
      BuildContext context, TextEditingController estimatedDuration) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.estimatedDurationLabel,
              hintText:
                  AppLocalizations.of(context)!.estimatedDurationHintText),
          controller: estimatedDuration,
          validator: (content) {
            if (content == null || content.isEmpty) {
              return null;
            }
            try {
              parseDuration(content);
            } on FormatException {
              return AppLocalizations.of(context)!
                  .estimatedDurationMalformedError;
            }
          },
        ));
  }

  GenericButton _confirmButton(
      TextEditingController estimatedDuration,
      PropertyValueNotifier<AuthorisedEvent> event,
      SelectDurationRouteArguments args,
      BuildContext context) {
    return GenericButton(
        onPressed: () {
          Duration d = parseDuration(estimatedDuration.text);
          if (d.compareTo(event.value.minDuration) < 0) {
            d = event.value.minDuration;
          }
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

  final PropertyValueNotifier<AuthorisedEvent> event;
  final Person person;
}

class AddVisitorRouteArguments {
  AddVisitorRouteArguments(this.event);

  final PropertyValueNotifier<AuthorisedEvent> event;
}
