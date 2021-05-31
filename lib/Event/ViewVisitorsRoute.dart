import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../NavBar.dart';
import '../PropertyValueNotifier.dart';
import 'AddVisitorRoute.dart';
import 'Event.dart';
import 'ViewPersonRoute.dart';

class ViewVisitorsRoute extends StatefulWidget {
  static const String route = '/ownEvents/viewVisitors';

  @override
  State<StatefulWidget> createState() => ViewVisitorsRouteState();
}

class ViewVisitorsRouteState extends State<ViewVisitorsRoute> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ViewVisitorsRouteArguments;
    return Scaffold(
        appBar: NavBar(args.event.value.name),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(AppLocalizations.of(context)!.manuallyAddedVisitors),
          Expanded(
            child: Center(
                child: ValueListenableBuilder<Event>(
                    valueListenable: args.event,
                    builder: (context, status, child) {
                      return ListView.builder(
                          itemCount: status.manualVisitors.length,
                          itemBuilder: (context, index) {
                            return ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      ViewPersonRoute.route,
                                      arguments: ViewPersonRouteArguments(
                                          status.manualVisitors[index]));
                                },
                                child: Text(status.manualVisitors[index].name));
                          });
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
}

class ViewVisitorsRouteArguments {
  ViewVisitorsRouteArguments(this.event);

  final PropertyValueNotifier<Event> event;
}
