import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mci_practicum/miscTypes/EventVisit.dart';

import '../../globals.dart';
import '../../miscWidgets/NavBar.dart';

class ViewEventVisitRoute extends StatelessWidget {
  static const String route = '/events/visited/viewVisit';

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat.Hms(appLocale.value?.toLanguageTag()).add_yMd();
    final args = ModalRoute.of(context)!.settings.arguments
    as ViewEventVisitRouteArguments;
    return Scaffold(
        appBar: NavBar(args.eventVisit.event.name),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Text(AppLocalizations.of(context)!
                  .name(args.eventVisit.event.name)),
              Text(AppLocalizations.of(context)!
                  .start(dateFormat.format(args.eventVisit.start))),
              Text(AppLocalizations.of(context)!.end(dateFormat.format(
                  args.eventVisit.start.add(args.eventVisit.visitDuration))))
            ])));
  }
}

class ViewEventVisitRouteArguments {
  ViewEventVisitRouteArguments(this.eventVisit);

  final EventVisit eventVisit;
}
