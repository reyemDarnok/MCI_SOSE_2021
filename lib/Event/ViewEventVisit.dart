import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mci_practicum/Event/EventVisit.dart';

import '../NavBar.dart';
import '../globals.dart';

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
              //TODO make nice
              Text(args.eventVisit.event.name),
              Text(dateFormat.format(args.eventVisit.start)),
              Text(dateFormat.format(
                  args.eventVisit.start.add(args.eventVisit.visitDuration)))
            ])));
  }
}

class ViewEventVisitRouteArguments {
  ViewEventVisitRouteArguments(this.eventVisit);

  final EventVisit eventVisit;
}
