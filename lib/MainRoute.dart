import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/Event/EventVisit.dart';
import 'package:mci_practicum/QRCodeButton.dart';
import 'package:mci_practicum/StatusWidget.dart';
import 'package:mci_practicum/TestEntryRoute.dart';
import 'package:mci_practicum/globals.dart';
import 'package:mci_practicum/utils.dart';

import 'Event/Event.dart';
import 'Event/OwnEventsRoute.dart';
import 'FAQ/FAQRoute.dart';
import 'NavBar.dart';
import 'PropertyValueNotifier.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    //TODO remove hacky solution
                    TextEditingController estimatedDuration =
                        TextEditingController(
                            text: event.minDuration.inHours.toString() + 'h');
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                            title: Text(
                                AppLocalizations.of(context)!.eventRegistered),
                            content: Column(children: [
                              Text(AppLocalizations.of(context)!
                                  .eventInfo(event.name, event.unique)),
                              TextFormField(
                                controller: estimatedDuration,
                                validator: (content) {
                                  if (content == null || content.isEmpty) {
                                    return null;
                                  }
                                  try {
                                    parseDuration(content);
                                  } on FormatException {
                                    return AppLocalizations.of(context)!
                                        .estimatedDurationMalformedError;
                                  }
                                },
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Duration d =
                                        parseDuration(estimatedDuration.text);
                                    visitedEvents.value.add(
                                        PropertyValueNotifier(EventVisit(
                                            event: event,
                                            start: DateTime.now(),
                                            visitDuration: d)));
                                    visitedEvents.notifyListeners();
                                    Navigator.of(context).pop();
                                    showDialog(
                                        context: context,
                                        builder: (context) => SimpleDialog(
                                            title: Text(AppLocalizations.of(
                                                    context)!
                                                .visitConfirmed(event.name))));
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)!.confirm))
                            ])));
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

