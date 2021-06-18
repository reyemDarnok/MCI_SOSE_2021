import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';
import 'package:mci_practicum/globals.dart';
import 'package:mci_practicum/miscTypes/EventVisit.dart';

import '../../miscWidgets/NavBar.dart';
import 'ViewEventVisit.dart';

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
                      visitedEvents.value.sort((a, b) => b.value.start
                          .add(b.value.visitDuration)
                          .compareTo(a.value.start.add(a.value.visitDuration)));
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
        leading: eventVisit.start
                    .add(eventVisit.visitDuration)
                    .compareTo(DateTime.now()) >
                0
            ? IconButton(
                onPressed: () => _changeVisitDuration(context, status, index),
                icon: Icon(Icons.stop, color: Colors.red))
            : IconButton(
                icon: Icon(Icons.stop, color: Colors.grey),
                onPressed: null,
              ),
        title: Center(child: Text(status[index].value.event.name)),
        subtitle:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(AppLocalizations.of(context)!
              .start(dateFormat.format(eventVisit.start))),
          Text(AppLocalizations.of(context)!.end(dateFormat
              .format(eventVisit.start.add(eventVisit.visitDuration)))),
        ]),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                        title: Text(AppLocalizations.of(context)!
                            .reallyDeleteVisit(
                                visitedEvents.value[index].value.event.name)),
                        children: [
                          SimpleDialogOption(
                              onPressed: () {
                                var deleted =
                                    visitedEvents.value.removeAt(index);
                                visitedEvents.notifyListeners();
                                log.i(
                                    'Deleted visit to event ${deleted.value.event.unique} starting at ${deleted.value.start.millisecondsSinceEpoch}');
                                Navigator.of(context).pop();
                              },
                              child: Text(AppLocalizations.of(context)!.yes)),
                          SimpleDialogOption(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(AppLocalizations.of(context)!.no))
                        ]));
          },
        ));
  }

  _changeVisitDuration(BuildContext context,
      List<PropertyValueNotifier<EventVisit>> status, int index) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text(AppLocalizations.of(context)!.signOutOfEvent),
              children: [
                SimpleDialogOption(
                    onPressed: () {
                      status[index].value.visitDuration =
                          DateTime.now().difference(status[index].value.start);
                      visitedEvents.notifyListeners();
                      Navigator.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context)!.yes)),
                SimpleDialogOption(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(AppLocalizations.of(context)!.no))
              ],
            ));
  }
}
