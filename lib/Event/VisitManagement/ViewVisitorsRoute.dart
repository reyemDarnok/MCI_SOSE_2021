import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mci_practicum/miscTypes/PersonVisit.dart';
import 'package:mci_practicum/miscWidgets/GenericButton.dart';

import '../../PropertyValueNotifier.dart';
import '../../globals.dart';
import '../../miscTypes/AuthorisedEvent.dart';
import '../../miscWidgets/NavBar.dart';
import 'AddVisitorRoute.dart';
import 'ViewPersonRoute.dart';

class ViewVisitorsRoute extends StatelessWidget {
  static const String route = '/events/own/viewVisitors';

  late final ViewVisitorsRouteArguments args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments
        as ViewVisitorsRouteArguments;
    return Scaffold(
        appBar: NavBar(args.event.value.name),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(AppLocalizations.of(context)!.manuallyAddedVisitors),
          Expanded(
            child: Center(
                child: ValueListenableBuilder<AuthorisedEvent>(
                    valueListenable: args.event,
                    builder: (context, status, child) {
                      status.manualVisitors.sort((a, b) =>
                          a.value.person.name.compareTo(b.value.person.name));
                      return ListView.builder(
                          itemCount: status.manualVisitors.length,
                          itemBuilder: (context, index) =>
                              _manualVisitorTile(context, status, index));
                    })),
          ),
                  GenericButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddVisitorRoute.route,
                  arguments: AddVisitorRouteArguments(
                    args.event,
                  ));
            },
            child: Text(AppLocalizations.of(context)!.addManualVisitors),
          ),
        ])));
  }

  Widget _manualVisitorTile(
      BuildContext context, AuthorisedEvent status, int index) {
    PersonVisit visit = status.manualVisitors[index].value;
    var dateFormat = DateFormat.Hms(appLocale.value?.toLanguageTag()).add_yMd();
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(ViewPersonRoute.route,
          arguments: ViewPersonRouteArguments(visit.person)),
      title: Center(child: Text(visit.person.name)),
      subtitle: Column(children: [
        Text(AppLocalizations.of(context)!.start(
          dateFormat.format(visit.startTime),
        )),
        Text(AppLocalizations.of(context)!
            .end(dateFormat.format(visit.startTime.add(visit.duration)))),
      ]),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                      title: Text(AppLocalizations.of(context)!
                          .reallyDeleteVisitor(
                              status.manualVisitors[index].value.person.name)),
                      children: [
                        SimpleDialogOption(
                            onPressed: () {
                              var deleted = args.event.value.manualVisitors
                                  .removeAt(index);
                              args.event.notifyListeners();
                              Navigator.of(context).pop();
                              log.i(
                                  'Deleted manual visitor ${deleted.value.person.toJson()} from event ${args.event.value.unique} starting at ${deleted.value.startTime.millisecondsSinceEpoch}');
                            },
                            child: Text(AppLocalizations.of(context)!.yes)),
                        SimpleDialogOption(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(AppLocalizations.of(context)!.no))
                      ]));
        },
      ),
    );
  }
}

class ViewVisitorsRouteArguments {
  ViewVisitorsRouteArguments(this.event);

  final PropertyValueNotifier<AuthorisedEvent> event;
}
