import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../miscTypes/Person.dart';

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
    name = TextEditingController(text: defaultPerson.name);
    telephoneNumber = TextEditingController(text: defaultPerson.telephone);
    street = TextEditingController(text: defaultPerson.street);
    city = TextEditingController(text: defaultPerson.city);
  }

  final String submitText;

  final RegExp phoneNumberRegex = RegExp(r'^[+\-()\d\s]+$');
  final RegExp cityRegex =
      RegExp(r'^(\d{5}[\s,]+[\w-]+|[\w-]+[\s,]+\d{5}|\d{5})$');

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
        child: Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width * 2 / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _nameFormField(context),
              _phoneNumberFormField(context),
              _streetFormField(context),
              _cityFormField(context),
              _submitButton()
            ],
          ),
        )));
  }

  ElevatedButton _submitButton() {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            callback(Person(
                name: name.text,
                telephone: telephoneNumber.text,
                street: street.text,
                city: city.text));
          }
        },
        child: Text(submitText));
  }

  TextFormField _cityFormField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.cityHintText,
          labelText: AppLocalizations.of(context)!.cityLabel),
      controller: city,
      validator: (value) {
        if (value == null) {
          return AppLocalizations.of(context)!.cityMissingError;
        } else if (!cityRegex.hasMatch(value)) {
          return AppLocalizations.of(context)!.cityMalformedError;
        }
      },
    );
  }

  TextFormField _streetFormField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.streetHintText,
          labelText: AppLocalizations.of(context)!.streetLabel),
      controller: street,
      validator: (value) {
        if (value == null) {
          return AppLocalizations.of(context)!.streetMissingError;
        } else {
          return null;
        }
      },
    );
  }

  TextFormField _phoneNumberFormField(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.phoneNumberHintText,
            labelText: AppLocalizations.of(context)!.phoneNumberLabel),
        controller: telephoneNumber,
        validator: (value) {
          if (value == null) {
            return AppLocalizations.of(context)!.phoneNumberMissingError;
          } else if (!phoneNumberRegex.hasMatch(value)) {
            return AppLocalizations.of(context)!.phoneNumberMalformedError;
          } else {
            return null;
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
