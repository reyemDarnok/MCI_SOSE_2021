import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/QRCodeButton.dart';
import 'package:mci_practicum/StatusWidget.dart';
import 'package:mci_practicum/TestEntryRoute.dart';

import 'Event/OwnEventsRoute.dart';

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> status = ValueNotifier(false);
    return MaterialApp(
        title: 'Corona EventApp',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Corona EventApp'),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OwnEventsRoute()));
                              },
                              child: Text(
                                  AppLocalizations.of(context)!.ownEvents,
                                  style: TextStyle(color: Colors.black))),
                        ),
                        PopupMenuItem(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                              //TODO Settings page
                              onPressed: () {},
                              child: Text(
                                  AppLocalizations.of(context)!.settings,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TestEntryRoute(
                                  status: status,
                                )));
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
        ));
  }

}