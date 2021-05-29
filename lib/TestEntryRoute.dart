import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/QRCodeButton.dart';

class TestEntryRoute extends StatelessWidget {
  TestEntryRoute({Key? key, required this.status}) : super(key: key);
  final ValueNotifier<bool> status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(AppLocalizations.of(context)!.enterTestResult),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enterCode,
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    status.value = true;
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
                    status.value = false;
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