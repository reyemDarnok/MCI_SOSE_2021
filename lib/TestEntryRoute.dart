import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'globals.dart';
import 'miscWidgets/NavBar.dart';

class TestEntryRoute extends StatelessWidget {
  static const String route = '/testEntry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(AppLocalizations.of(context)!.enterTestResult),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                            title: Text(AppLocalizations.of(context)!
                                .confirmSendPositive),
                            children: [
                              SimpleDialogOption(
                                  onPressed: () {
                                    status.value = true;
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    showDialog(
                                        context: context,
                                        builder: (context) => SimpleDialog(
                                            title: Text(
                                                AppLocalizations.of(context)!
                                                    .informedGovernment)));
                                  },
                                  child:
                                      Text(AppLocalizations.of(context)!.yes)),
                              SimpleDialogOption(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(AppLocalizations.of(context)!.no))
                            ]));
              },
                  child: Text(
                    AppLocalizations.of(context)!.positive,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                            title: Text(AppLocalizations.of(context)!
                                .confirmSendPositive),
                            children: [
                              SimpleDialogOption(
                                  onPressed: () {
                                    status.value = false;
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    showDialog(
                                        context: context,
                                        builder: (context) => SimpleDialog(
                                            title: Text(
                                                AppLocalizations.of(context)!
                                                    .informedGovernment)));
                                  },
                                  child:
                                      Text(AppLocalizations.of(context)!.yes)),
                              SimpleDialogOption(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(AppLocalizations.of(context)!.no))
                            ]));
              },
              child: Text(
                AppLocalizations.of(context)!.negative,
              ),
            ),
          ],
        ),
      ),
    );
  }
}