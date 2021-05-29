import 'package:flutter/material.dart';

import 'Person.dart';

typedef PersonCallback = void Function(Person person);

class PersonEntryForm extends StatefulWidget {
  PersonEntryForm({Key? key, required this.callback}) : super(key: key);
  final PersonCallback callback;

  @override
  State<StatefulWidget> createState() =>
      PersonEntryFormState(callback: callback);
}

class PersonEntryFormState extends State<PersonEntryForm> {
  PersonEntryFormState({required this.callback});

  final RegExp phoneNumberRegex = new RegExp(r'^[+\-()\d\s]+$');
  final RegExp streetRegex = new RegExp(r'^[\w\s.,-]+$');
  final RegExp cityRegex =
      new RegExp(r'^(\d{5}[\s,]+[\w-]+|[\w-]+[\s,]+\d{5}|\d{5})$');
  final PersonCallback callback;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController name = new TextEditingController();
    TextEditingController telephoneNumber = new TextEditingController();
    TextEditingController street = new TextEditingController();
    TextEditingController city = new TextEditingController();
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
              controller: telephoneNumber,
              validator: (value) {
                if (value == null) {
                  return 'Es muss eine Telefonnummer angegeben werden';
                } else if (!phoneNumberRegex.hasMatch(value)) {
                  return 'Das sieht nicht nach einer Telefonnummer aus';
                } else {
                  return null;
                }
              }),
          TextFormField(
            controller: street,
            validator: (value) {
              if (value == null) {
                return 'Es muss eine Straße und Hausnummer angegeben werden';
              } else if (!streetRegex.hasMatch(value)) {
                return 'Das sieht nicht nach einer Straße und Hausnummer aus';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: city,
            validator: (value) {
              if (value == null) {
                return 'Es muss eine Stadt angegeben werden';
              } else if (!cityRegex.hasMatch(value)) {
                return 'Es muss eine PLZ und optional ein Stadtname angegeben werden';
              }
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  callback(Person(
                      name: name.text,
                      telephone: telephoneNumber.text,
                      street: street.text,
                      city: city.text));
                }
              },
              child: Text('Hinzufügen'))
        ],
      ),
    );
  }
}
