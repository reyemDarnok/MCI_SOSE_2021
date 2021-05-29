import 'package:flutter/material.dart';

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
    name = new TextEditingController(text: defaultName);
    minDuration = new TextEditingController(text: defaultDuration.toString());
  }

  final EventCallback callback;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController name;
  late final TextEditingController minDuration;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Es muss ein Name angegeben werden';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
              controller: minDuration,
              validator: (value) {
                if (value == null) {
                  return 'Es muss eine MindestDauer angegeben werden';
                } else if (num.tryParse(value) == null) {
                  return 'Mindestdauer muss eine Zahl sein';
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
              child: Text('Hinzufügen'))
        ],
      ),
    );
  }
}
