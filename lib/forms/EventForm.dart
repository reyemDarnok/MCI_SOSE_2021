import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../miscTypes/Event.dart';

typedef EventCallback = void Function(Event person);

class EventForm extends StatefulWidget {
  EventForm({Key? key,
    required this.callback,
    this.defaultName = '',
    this.defaultDuration = '3h'})
      : super(key: key);
  final EventCallback callback;
  final String defaultName;
  final String defaultDuration;

  @override
  State<StatefulWidget> createState() => EventFormState(
      callback: callback,
      defaultName: defaultName,
      defaultDuration: defaultDuration);
}

class EventFormState extends State<EventForm> {
  EventFormState({
    required this.callback,
    required String defaultName,
    required String defaultDuration,
  }) {
    name = TextEditingController(text: defaultName);
    minDuration = TextEditingController(text: defaultDuration);
  }

  final EventCallback callback;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController name;
  late final TextEditingController minDuration;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 2 / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _nameFormField(context),
                  _minDurationFormField(context),
                  _addButton(context)
                ],
              ),
            )));
  }

  ElevatedButton _addButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            callback(Event(
                name: name.text, minDuration: parseDuration(minDuration.text)));
          }
        },
        child: Text(AppLocalizations.of(context)!.add));
  }

  TextFormField _minDurationFormField(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.minDurationHintText,
            labelText: AppLocalizations.of(context)!.minDurationLabel),
        controller: minDuration,
        validator: (value) {
          if (value == null) {
            return AppLocalizations.of(context)!.minDurationMissingError;
          } else {
            try {
              parseDuration(value);
              return null;
            } on FormatException {
              return AppLocalizations.of(context)!.minDurationMalformedError;
            }
          }
        });
  }

  TextFormField _nameFormField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.nameHintText,
          labelText: AppLocalizations.of(context)!.nameLabel),
      controller: name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.nameMissingError;
        } else {
          return null;
        }
      },
    );
  }
}
