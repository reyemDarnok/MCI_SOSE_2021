import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../globals.dart';
import 'EventForm.dart';

class CreateEventRoute extends StatelessWidget {
  static const String route = '/ownEvents/createEvent';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CreateEventRouteArguments;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(AppLocalizations.of(context)!.newEvent),
        ),
        body: EventForm(
          callback: (event) {
            events.add(event);
            args.update();
          },
        ));
  }
}

class CreateEventRouteArguments {
  CreateEventRouteArguments(this.update);

  final VoidCallback update;
}