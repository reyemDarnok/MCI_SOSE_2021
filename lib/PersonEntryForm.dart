import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Person.dart';

typedef PersonCallback = void Function(Person person);

class PersonEntryForm extends StatefulWidget {
  PersonEntryForm(
      {Key? key,
      required this.callback,
      required this.submitText,
      Person? defaultPerson})
      : super(key: key) {
    if (defaultPerson == null) {
      this.defaultPerson =
          Person(city: '', name: '', telephone: '', street: '');
    } else {
      this.defaultPerson = defaultPerson;
    }
  }

  final PersonCallback callback;
  late final Person defaultPerson;
  final String submitText;

  @override
  State<StatefulWidget> createState() => PersonEntryFormState(
        callback: callback,
        defaultPerson: defaultPerson,
        submitText: submitText,
      );
}

class PersonEntryFormState extends State<PersonEntryForm> {
  PersonEntryFormState(
      {required this.callback,
      required Person defaultPerson,
      required this.submitText}) {
    name = new TextEditingController(text: defaultPerson.name);
    telephoneNumber = new TextEditingController(text: defaultPerson.telephone);
    street = new TextEditingController(text: defaultPerson.street);
    city = new TextEditingController(text: defaultPerson.city);
  }

  final String submitText;

  final RegExp phoneNumberRegex = new RegExp(r'^[+\-()\d\s]+$');
  final RegExp streetRegex = new RegExp(r'^[\w\s.,-]+$');
  final RegExp cityRegex =
      new RegExp(r'^(\d{5}[\s,]+[\w-]+|[\w-]+[\s,]+\d{5}|\d{5})$');

  final PersonCallback callback;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController name;
  late final TextEditingController telephoneNumber;
  late final TextEditingController street;
  late final TextEditingController city;

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
                return AppLocalizations.of(context)!.nameMissingError;
              } else {
                return null;
              }
            },
          ),
          TextFormField(
              controller: telephoneNumber,
              validator: (value) {
                if (value == null) {
                  return AppLocalizations.of(context)!.phoneNumberMissingError;
                } else if (!phoneNumberRegex.hasMatch(value)) {
                  return AppLocalizations.of(context)!
                      .phoneNumberMalformedError;
                } else {
                  return null;
                }
              }),
          TextFormField(
            controller: street,
            validator: (value) {
              if (value == null) {
                return AppLocalizations.of(context)!.streetMissingError;
              } else if (!streetRegex.hasMatch(value)) {
                return AppLocalizations.of(context)!.streetMalformedError;
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: city,
            validator: (value) {
              if (value == null) {
                return AppLocalizations.of(context)!.cityMissingError;
              } else if (!cityRegex.hasMatch(value)) {
                return AppLocalizations.of(context)!.cityMalformedError;
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
              child: Text(submitText))
        ],
      ),
    );
  }
}
