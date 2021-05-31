import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../NavBar.dart';

//TODO everything
class FAQRoute extends StatelessWidget {
  static const String route = '/faq';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(AppLocalizations.of(context)!.faq),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
