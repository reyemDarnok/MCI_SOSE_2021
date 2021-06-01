import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/globals.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../NavBar.dart';

class InternalsRoute extends StatelessWidget {
  static const String route = '/settings/internals';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(AppLocalizations.of(context)!.settings),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  launch('https://github.com/reyemDarnok/MCI_SOSE_2021/');
                },
                child: Text(AppLocalizations.of(context)!.sourceCode)),
            ElevatedButton(
                onPressed: () {
                  Share.share(getWebLog());
                },
                child: Row(
                  children: [
                    Text(AppLocalizations.of(context)!.logfile),
                    Icon(Icons.share)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
