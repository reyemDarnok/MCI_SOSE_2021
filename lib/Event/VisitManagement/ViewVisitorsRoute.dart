import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/miscWidgets/GenericButton.dart';

import '../../PropertyValueNotifier.dart';
import '../../miscTypes/AuthorisedEvent.dart';
import '../../miscWidgets/NavBar.dart';
import 'AddVisitorRoute.dart';
import 'ViewPersonRoute.dart';

class ViewVisitorsRoute extends StatelessWidget {
  static const String route = '/events/own/viewVisitors';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
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

  GenericButton _manualVisitorTile(
      BuildContext context, AuthorisedEvent status, int index) {
    return GenericButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ViewPersonRoute.route,
              arguments: ViewPersonRouteArguments(
                  status.manualVisitors[index].value.person));
        },
        child: Text(status.manualVisitors[index].value.person.name));
  }
}

class ViewVisitorsRouteArguments {
  ViewVisitorsRouteArguments(this.event);

  final PropertyValueNotifier<AuthorisedEvent> event;
}
