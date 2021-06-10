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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              _minDuration(context, args),
              _showManualVisitorsButton(args),
              _addManualVisitorsButton(context, args),
              _visitorQRCode(args),
              //TODO share image button
              _shareQRCodeButton(args, context),
            ])));
  }

  ElevatedButton _shareQRCodeButton(
      ViewEventRouteArguments args, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Share.share(jsonEncode(args.event.value));
        },
        child: Text(AppLocalizations.of(context)!.shareQRCode));
  }

  QrImage _visitorQRCode(ViewEventRouteArguments args) {
    return QrImage(
        embeddedImage: Image.asset('assets/logo.png').image,
        data: jsonEncode(args.event.value),
        errorCorrectionLevel: QrErrorCorrectLevel.H,
        size: 200);
  }

  ElevatedButton _addManualVisitorsButton(
      BuildContext context, ViewEventRouteArguments args) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddVisitorRoute.route,
              arguments: AddVisitorRouteArguments(
                args.event,
              ));
        },
        child: Text(AppLocalizations.of(context)!.addManualVisitors));
  }

  ValueListenableBuilder<Event> _showManualVisitorsButton(
      ViewEventRouteArguments args) {
    return ValueListenableBuilder<Event>(
        valueListenable: args.event,
        builder: (context, status, child) {
          return ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ViewVisitorsRoute.route,
                    arguments: ViewVisitorsRouteArguments(args.event));
              },
              child: Text(AppLocalizations.of(context)!
                  .manualVisitors(status.manualVisitors.length.toString())));
        });
  }

  Text _minDuration(BuildContext context, ViewEventRouteArguments args) {
    return Text(AppLocalizations.of(context)!
        .minDuration(args.event.value.minDuration.toString()));
  }
}

class ViewEventRouteArguments {
  ViewEventRouteArguments(this.event);

  final PropertyValueNotifier<Event> event;
}
