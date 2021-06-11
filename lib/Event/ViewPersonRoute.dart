import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../NavBar.dart';
import '../Person.dart';

class ViewPersonRoute extends StatelessWidget {
  static const String route = '/events/own/viewPerson';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ViewPersonRouteArguments;
    return Scaffold(
        appBar: NavBar(args.person.name),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Text(AppLocalizations.of(context)!.name(args.person.name)),
              Text(AppLocalizations.of(context)!
                  .phoneNumber(args.person.telephone)),
              Text(AppLocalizations.of(context)!.street(args.person.street)),
              Text(AppLocalizations.of(context)!.city(args.person.city)),
            ])));
  }
}

class ViewPersonRouteArguments {
  ViewPersonRouteArguments(this.person);

  final Person person;
}
