import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../NavBar.dart';
import 'AddVisitorRoute.dart';
import 'Event.dart';
import 'ViewVisitorsRoute.dart';

class ViewEventRoute extends StatelessWidget {
  static const String route = '/ownEvents/viewEvent';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ViewEventRouteArguments;
    return Scaffold(
        appBar: NavBar(args.event.value.name),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(AppLocalizations.of(context)!.minDurationLabel +
              args.event.value.minDuration.toString()),
          ValueListenableBuilder<Event>(
              valueListenable: args.event,
              builder: (context, status, child) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ViewVisitorsRoute.route,
                          arguments: ViewVisitorsRouteArguments(args.event));
                    },
                    child: Text(
                        AppLocalizations.of(context)!.manualVisitorsLabel +
                            status.manualVisitors.length.toString()));
              }),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddVisitorRoute.route,
                    arguments: AddVisitorRouteArguments(
                      args.event,
                    ));
              },
              child: Text(AppLocalizations.of(context)!.addManualVisitors)),
          QrImage(
              data: jsonEncode(args.event.value),
              errorCorrectionLevel: QrErrorCorrectLevel.H,
              size: 200),
          //TODO share image button
          ElevatedButton(
              onPressed: () {
                Share.share(jsonEncode(args.event));
              },
              child: Text(AppLocalizations.of(context)!.shareQRCode)),
        ])));
  }
}

class ViewEventRouteArguments {
  ViewEventRouteArguments(this.event);

  final PropertyValueNotifier<Event> event;
}
