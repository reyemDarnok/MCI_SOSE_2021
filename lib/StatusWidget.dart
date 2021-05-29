import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusWidget extends StatelessWidget {
  StatusWidget({Key? key, required this.status}) : super(key: key);
  final ValueListenable<bool> status;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: status,
        builder: (context, status, child) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text(AppLocalizations.of(context)!.infectionRisk),
            status
                ? Text(
                    AppLocalizations.of(context)!.high,
                    style: TextStyle(backgroundColor: Colors.red),
                  )
                : Text(
                    AppLocalizations.of(context)!.low,
                    style: TextStyle(backgroundColor: Colors.green),
                  )
          ]);
        }
    );
  }
}