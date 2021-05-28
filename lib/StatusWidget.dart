import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
                Text('Kontakt mit Infizierten: '),
                status ?
                Text('Ja', style: TextStyle(backgroundColor: Colors.red),)
                    :
                Text('Nein', style: TextStyle(backgroundColor: Colors.green),)
              ]
          );
        }
    );
  }
}