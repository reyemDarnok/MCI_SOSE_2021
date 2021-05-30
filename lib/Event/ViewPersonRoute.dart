import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Person.dart';

class ViewPersonRoute extends StatelessWidget {
  static const String route = '/ownEvents/viewPerson';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ViewPersonRouteArguments;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(args.person.name),
        ),
        body: Center(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Text(AppLocalizations.of(context)!.nameLabel),
          Text(args.person.name),
          Text(AppLocalizations.of(context)!.phoneNumberLabel),
          Text(args.person.telephone),
          Text(AppLocalizations.of(context)!.streetLabel),
          Text(args.person.street),
          Text(AppLocalizations.of(context)!.cityLabel),
          Text(args.person.city),
        ])));
  }
}

class ViewPersonRouteArguments {
  ViewPersonRouteArguments(this.person);

  final Person person;
}
