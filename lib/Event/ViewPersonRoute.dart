import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Person.dart';

class ViewPersonRoute extends StatelessWidget {
  ViewPersonRoute({Key? key, required this.person}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(person.name),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Text(AppLocalizations.of(context)!.nameLabel),
          Text(person.name),
          Text(AppLocalizations.of(context)!.phoneNumberLabel),
          Text(person.telephone),
          Text(AppLocalizations.of(context)!.streetLabel),
          Text(person.street),
          Text(AppLocalizations.of(context)!.cityLabel),
          Text(person.city),
        ]))
    );
  }
}
