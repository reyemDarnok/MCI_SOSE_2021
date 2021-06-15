import 'dart:convert';

import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/TestEntryRoute.dart';
import 'package:mci_practicum/globals.dart';
import 'package:mci_practicum/miscTypes/EventVisit.dart';
import 'package:mci_practicum/miscWidgets/GenericButton.dart';
import 'package:mci_practicum/miscWidgets/QRCodeButton.dart';
import 'package:mci_practicum/miscWidgets/StatusWidget.dart';

import 'Event/EventsRoute.dart';
import 'FAQ/FAQRoute.dart';
import 'PropertyValueNotifier.dart';
import 'Settings/SettingsRoute.dart';
import 'miscTypes/Event.dart';
import 'miscWidgets/NavBar.dart';

class MainRoute extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    appLocale.value = Localizations.localeOf(context);
    return Scaffold(
      appBar: NavBar(
        AppLocalizations.of(context)!.title,
        preTitle: Image.asset('assets/logo.png'),
        actions: [_popupMenu(context)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StatusWidget(),
            _enterTestResultsButton(context, status),
            _scanQRCodeButton(context),
          ],
        ),
      ),
    );
  }

  QRCodeButton _scanQRCodeButton(BuildContext context) {
    return QRCodeButton(
        callback: (s) {
          try {
            Event event = Event.fromJson(jsonDecode(s));
            //TODO localization
            TextEditingController estimatedDuration = TextEditingController(
                text: prettyDuration(event.minDuration,
                    abbreviated: true,
                    locale: DurationLocale.fromLanguageCode('en')!));
            _showRegisterToEventDialog(context, event, estimatedDuration);
          } on FormatException {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    title: Text(AppLocalizations.of(context)!.unknownQRCode)));
          }
        },
        text: AppLocalizations.of(context)!.scanQRCode);
  }

  void _showRegisterToEventDialog(BuildContext context, Event event,
      TextEditingController estimatedDuration) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.eventRegistered),
            content: Column(children: [
              Text(AppLocalizations.of(context)!
                  .eventInfo(event.name, event.unique)),
              _estimatedDurationFormField(context, estimatedDuration),
              _confirmButton(estimatedDuration, event, context)
            ])));
  }

  ElevatedButton _confirmButton(TextEditingController estimatedDuration,
      Event event, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Duration d = parseDuration(estimatedDuration.text);
          visitedEvents.value.add(PropertyValueNotifier(EventVisit(
              event: event, start: DateTime.now(), visitDuration: d)));
          visitedEvents.notifyListeners();
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                  title: Text(AppLocalizations.of(context)!
                      .visitConfirmed(event.name))));
        },
        child: Text(AppLocalizations.of(context)!.confirm));
  }

  TextFormField _estimatedDurationFormField(
      BuildContext context, TextEditingController estimatedDuration) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.estimatedDurationLabel,
          hintText: AppLocalizations.of(context)!.estimatedDurationHintText),
      controller: estimatedDuration,
      validator: (content) {
        if (content == null || content.isEmpty) {
          return null;
        }
        try {
          parseDuration(content);
        } on FormatException {
          return AppLocalizations.of(context)!.estimatedDurationMalformedError;
        }
      },
    );
  }

  GenericButton _enterTestResultsButton(
      BuildContext context, ValueNotifier<bool> status) {
    return GenericButton(
      onPressed: () => Navigator.of(context).pushNamed(
        TestEntryRoute.route,
      ),
      child: Text(AppLocalizations.of(context)!.enterTestResult),
    );
  }

  PopupMenuButton<String> _popupMenu(BuildContext context) {
    return PopupMenuButton(
        onSelected: (value) {
          Navigator.of(context).pushNamed(value.toString());
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: EventsRoute.route,
                  child: Text(
                    AppLocalizations.of(context)!.events,
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
            ]);
  }
}

