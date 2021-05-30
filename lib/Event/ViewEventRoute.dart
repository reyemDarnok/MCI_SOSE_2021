import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../NavBar.dart';
import 'AddVisitorRoute.dart';
import 'Event.dart';
import 'ViewVisitorsRoute.dart';

class ViewEventRoute extends StatefulWidget {
  static const String route = '/ownEvents/viewEvent';

  @override
  State<StatefulWidget> createState() => ViewEventRouteState();
}

class ViewEventRouteState extends State<ViewEventRoute> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ViewEventRouteArguments;
    return Scaffold(
        appBar: NavBar(args.event.name),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(AppLocalizations.of(context)!.minDurationLabel +
              args.event.minDuration.toString()),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ViewVisitorsRoute.route,
                    arguments: ViewVisitorsRouteArguments(args.event, () {
                      setState(() {});
                    }));
              },
              child: Text(AppLocalizations.of(context)!.manualVisitorsLabel +
                  args.event.manualVisitors.length.toString())),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddVisitorRoute.route,
                    arguments: AddVisitorRouteArguments(args.event, () {
                      setState(() {});
                    }));
              },
              child: Text(AppLocalizations.of(context)!.addManualVisitors)),
          //TODO replace with QR Code
          Text('Here should be a QR Code'),
          ElevatedButton(
              //TODO onPressed shares the QR Code
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.shareQRCode)),
        ])));
  }
}

class ViewEventRouteArguments {
  ViewEventRouteArguments(this.event);

  final Event event;
}
