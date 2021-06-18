import 'dart:convert';

import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';
import 'package:mci_practicum/miscTypes/PublicEvent.dart';
import 'package:mci_practicum/miscWidgets/GenericButton.dart';
import 'package:mci_practicum/sizes.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../globals.dart';
import '../../miscTypes/AuthorisedEvent.dart';
import '../../miscWidgets/NavBar.dart';
import '../VisitManagement/AddVisitorRoute.dart';
import '../VisitManagement/ViewVisitorsRoute.dart';

class ViewEventRoute extends StatelessWidget {
  static const String route = '/events/own/viewEvent';

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
              Text(AppLocalizations.of(context)!.visitorCode),
              _visitorQRCode(args, context),
              _sharePublicQRCodeButton(args, context),

              Text(AppLocalizations.of(context)!.authCode),
              _authQRCode(args, context),
              _sharePrivateQRCodeButton(args, context),
              //TODO share image button
            ])));
  }

  GenericButton _sharePublicQRCodeButton(
      ViewEventRouteArguments args, BuildContext context) {
    PublicEvent public = PublicEvent.fromAuthorisedEvent(args.event.value);
    return GenericButton(
        onPressed: () {
          Share.share(jsonEncode(public));
        },
        child: Text(AppLocalizations.of(context)!.shareQRCode));
  }

  QrImage _visitorQRCode(ViewEventRouteArguments args, BuildContext context) {
    PublicEvent public = PublicEvent.fromAuthorisedEvent(args.event.value);
    log.d(qrCodeWidth(context));
    return QrImage(
        embeddedImage: Image.asset('assets/logo.png').image,
        data: jsonEncode(public),
        errorCorrectionLevel: QrErrorCorrectLevel.L,
        size: qrCodeWidth(context) * 1.2);
  }

  QrImage _authQRCode(ViewEventRouteArguments args, BuildContext context) {
    log.d(qrCodeWidth(context));
    return QrImage(
        embeddedImage: Image.asset('assets/logo.png').image,
        data: jsonEncode(args.event.value),
        errorCorrectionLevel: QrErrorCorrectLevel.L,
        size: qrCodeWidth(context) * 1.1);
  }

  GenericButton _sharePrivateQRCodeButton(
      ViewEventRouteArguments args, BuildContext context) {
    return GenericButton(
        onPressed: () {
          Share.share(jsonEncode(args.event.value));
        },
        child: Text(AppLocalizations.of(context)!.shareQRCode));
  }

  GenericButton _addManualVisitorsButton(
      BuildContext context, ViewEventRouteArguments args) {
    return GenericButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddVisitorRoute.route,
              arguments: AddVisitorRouteArguments(
                args.event,
              ));
        },
        child: Text(AppLocalizations.of(context)!.addManualVisitors));
  }

  ValueListenableBuilder<AuthorisedEvent> _showManualVisitorsButton(
      ViewEventRouteArguments args) {
    return ValueListenableBuilder<AuthorisedEvent>(
        valueListenable: args.event,
        builder: (context, status, child) {
          return GenericButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ViewVisitorsRoute.route,
                    arguments: ViewVisitorsRouteArguments(args.event));
              },
              child: Text(AppLocalizations.of(context)!
                  .manualVisitors(status.manualVisitors.length.toString())));
        });
  }

  Text _minDuration(BuildContext context, ViewEventRouteArguments args) {
    return Text(AppLocalizations.of(context)!.minDuration(prettyDuration(
        args.event.value.minDuration,
        abbreviated: true,
        locale: DurationLocale.fromLanguageCode('en')!)));
  }
}

class ViewEventRouteArguments {
  ViewEventRouteArguments(this.event);

  final PropertyValueNotifier<AuthorisedEvent> event;
}
