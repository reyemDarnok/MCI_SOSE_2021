import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/globals.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
                onPressed: () async {
                  if (kIsWeb) {
                    Share.share(getWebLog());
                  } else {
                    Share.shareFiles([
                      join((await getApplicationDocumentsDirectory()).path,
                          'logfile.log')
                    ]);
                  }
                  Share.share('Logfile'); //TODO actual logs
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
