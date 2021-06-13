import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mci_practicum/Event/EventVisit.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';
import 'package:mci_practicum/globals.dart';

import '../../miscWidgets/NavBar.dart';
import '../EventManagement/ViewEventVisit.dart';

class ViewVisitedEventsRoute extends StatelessWidget {
  static const String route = '/events/visited';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(AppLocalizations.of(context)!.visitedEvents),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            child: Center(
                child: ValueListenableBuilder<
                        List<PropertyValueNotifier<EventVisit>>>(
                    valueListenable: visitedEvents,
                    builder: (context, status, child) {
                      return ListView.builder(
                          itemCount: status.length,
                          itemBuilder: (context, index) =>
                              _eventVisitTile(context, status, index));
                    })),
          ),
        ])));
  }

  _eventVisitTile(BuildContext context,
      List<PropertyValueNotifier<EventVisit>> status, int index) {
    var eventVisit = status[index].value;
    var dateFormat = DateFormat.Hms(appLocale.value?.toLanguageTag()).add_yMd();
    return ListTile(
        onTap: () => Navigator.of(context).pushNamed(ViewEventVisitRoute.route,
            arguments: ViewEventVisitRouteArguments(eventVisit)),
        tileColor: eventVisit.start
                .add(eventVisit.visitDuration)
                .isAfter(DateTime.now())
            ? null
            : Colors.grey,
        title: Center(child: Text(status[index].value.event.name)),
        subtitle:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(AppLocalizations.of(context)!
              .start(dateFormat.format(eventVisit.start))),
          Text(AppLocalizations.of(context)!.end(dateFormat
              .format(eventVisit.start.add(eventVisit.visitDuration)))),
        ]));
  }
}
