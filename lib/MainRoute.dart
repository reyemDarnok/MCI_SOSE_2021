import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/QRCodeButton.dart';
import 'package:mci_practicum/StatusWidget.dart';
import 'package:mci_practicum/TestEntryRoute.dart';

import 'Event/Event.dart';
import 'Event/OwnEventsRoute.dart';
import 'FAQ/FAQRoute.dart';
import 'NavBar.dart';
import 'Settings/SettingsRoute.dart';

class MainRoute extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> status = ValueNotifier(false);
    return Scaffold(
      appBar: NavBar(
        AppLocalizations.of(context)!.title,
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                Navigator.of(context).pushNamed(value.toString());
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                    value: OwnEventsRoute.route,
                    child: Text(
                      AppLocalizations.of(context)!.ownEvents,
                    )),
                PopupMenuItem(
                    value: SettingsRoute.route,
                    child: Text(
                      AppLocalizations.of(context)!.settings,
                    )),
                PopupMenuItem(
                    value: FAQRoute.route,
                    child: Text(
                      AppLocalizations.of(context)!.faq,
                    )),
              ])
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StatusWidget(status: status),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(TestEntryRoute.route,
                    arguments: TestEntryArguments(status));
              },
              child: Text(AppLocalizations.of(context)!.enterTestResult),
            ),
            QRCodeButton(
                callback: (s) {
                  try {
                    Event event = Event.fromJson(jsonDecode(s));
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: Text(
                                AppLocalizations.of(context)!.eventRegistered),
                            content: Text(AppLocalizations.of(context)!
                                .eventInfo(event.name, event.unique))));
                  } on FormatException {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: Text(
                                AppLocalizations.of(context)!.unknownQRCode)));
                  }
                },
                text: AppLocalizations.of(context)!.scanQRCode),
          ],
        ),
      ),
    );
  }
}
