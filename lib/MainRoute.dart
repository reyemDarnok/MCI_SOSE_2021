import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/QRCodeButton.dart';
import 'package:mci_practicum/StatusWidget.dart';
import 'package:mci_practicum/TestEntryRoute.dart';

import 'Event/OwnEventsRoute.dart';
import 'Settings/SettingsRoute.dart';

class MainRoute extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> status = ValueNotifier(false);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white)),
                      onPressed: () {
                            Navigator.pushNamed(
                              context,
                              OwnEventsRoute.route,
                            );
                          },
                      child: Text(
                          AppLocalizations.of(context)!.ownEvents,
                          style: TextStyle(color: Colors.black))),
                ),
                PopupMenuItem(
                  child: ElevatedButton(
                      style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          onPressed: () {
                            Navigator.pushNamed(context, SettingsRoute.route);
                          },
                          child: Text(AppLocalizations.of(context)!.settings,
                              style: TextStyle(color: Colors.black))),
                ),
                PopupMenuItem(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.white)),
                      //TODO FAQ page
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.faq,
                          style: TextStyle(color: Colors.black))),
                ),
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
                Navigator.pushNamed(context, TestEntryRoute.route,
                    arguments: TestEntryArguments(status));
              },
              child: Text(AppLocalizations.of(context)!.enterTestResult),
            ),
            QRCodeButton(
              //TODO real action
                callback: (s) {},
                text: AppLocalizations.of(context)!.scanQRCode),
          ],
        ),
      ),
    );
  }

}