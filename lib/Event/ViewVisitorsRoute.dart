import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../NavBar.dart';
import '../PropertyValueNotifier.dart';
import 'AddVisitorRoute.dart';
import 'Event.dart';
import 'ViewPersonRoute.dart';

class ViewVisitorsRoute extends StatelessWidget {
  static const String route = '/ownEvents/viewVisitors';

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
                child: ValueListenableBuilder<Event>(
                    valueListenable: args.event,
                    builder: (context, status, child) {
                      return ListView.builder(
                          itemCount: status.manualVisitors.length,
                          itemBuilder: (context, index) =>
                              _manualVisitorTile(context, status, index));
                    })),
          ),
          ElevatedButton(
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

  ElevatedButton _manualVisitorTile(
      BuildContext context, Event status, int index) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ViewPersonRoute.route,
              arguments:
                  ViewPersonRouteArguments(status.manualVisitors[index]));
        },
        child: Text(status.manualVisitors[index].name));
  }
}

class ViewVisitorsRouteArguments {
  ViewVisitorsRouteArguments(this.event);

  final PropertyValueNotifier<Event> event;
}
