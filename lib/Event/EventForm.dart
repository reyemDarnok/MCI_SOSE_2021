import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Event.dart';

typedef EventCallback = void Function(Event person);

class EventForm extends StatefulWidget {
  EventForm(
      {Key? key,
      required this.callback,
      this.defaultName = '',
      this.defaultDuration = 3})
      : super(key: key);
  final EventCallback callback;
  final String defaultName;
  final num defaultDuration;

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
    required num defaultDuration,
  }) {
    name = TextEditingController(text: defaultName);
    minDuration = TextEditingController(text: defaultDuration.toString());
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
              TextFormField(
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
              ),
              TextFormField(
                  decoration: InputDecoration(
                      hintText:
                      AppLocalizations.of(context)!.minDurationHintText,
                      labelText:
                      AppLocalizations.of(context)!.minDurationLabel),
                  controller: minDuration,
                  validator: (value) {
                    if (value == null) {
                      return AppLocalizations.of(context)!
                          .minDurationMissingError;
                    } else if (num.tryParse(value) == null) {
                      return AppLocalizations.of(context)!
                          .minDurationMalformedError;
                    } else {
                      return null;
                    }
                  }),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      callback(Event(
                          name: name.text,
                          minDuration: num.parse(minDuration.text)));
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.add))
            ],
          ),
        )));
  }
}
