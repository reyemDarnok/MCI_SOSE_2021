import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../NavBar.dart';

//TODO make it not a settings clone
class FAQRoute extends StatelessWidget {
  static const String route = '/faq';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(AppLocalizations.of(context)!.faq),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO Language change
            ElevatedButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.language)),
            //TODO Personal Data
            ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.personalData),
            ),
            //TODO Internal Workings
            ElevatedButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.internalWorkings))
          ],
        ),
      ),
    );
  }
}
