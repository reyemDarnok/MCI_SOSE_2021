import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/QRCodeButton.dart';

import 'NavBar.dart';

class TestEntryRoute extends StatelessWidget {
  static const String route = '/testEntry';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as TestEntryArguments;
    return Scaffold(
      appBar: NavBar(AppLocalizations.of(context)!.enterTestResult),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enterCode,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    args.status.value = true;
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
                    args.status.value = false;
                  },
                  child: Text(
                    AppLocalizations.of(context)!.negative,
                  ),
                ),
              ],
            ),
            QRCodeButton(
                callback: (s) {},
                text: AppLocalizations.of(context)!.scanTestQRCode)
          ],
        ),
      ),
    );
  }
}

class TestEntryArguments {
  TestEntryArguments(this.status);

  final ValueNotifier<bool> status;
}
