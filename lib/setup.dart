import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'MainRoute.dart';

class Setup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppLocalizations.of(context)?.title ?? 'Corona EventApp',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: MainRoute());
  }
}
