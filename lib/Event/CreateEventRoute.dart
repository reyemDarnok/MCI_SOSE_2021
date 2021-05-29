import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../globals.dart';
import 'EventForm.dart';

class CreateEventRoute extends StatelessWidget {
  CreateEventRoute({
    Key? key,
    required this.update,
  }) : super(key: key);
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
          title: Text(AppLocalizations.of(context)!.newEvent),
        ),
        body: EventForm(
          callback: (event) {
            events.add(event);
            update();
          },
        ));
  }

}