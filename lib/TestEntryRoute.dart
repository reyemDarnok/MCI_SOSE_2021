import 'package:flutter/material.dart';
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
        title: Text('Testergebnis eingeben'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Code eingeben',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: (){
                      status.value = true;
                    },
                    child: Text('Positiv',),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
                    ),
                    onPressed: (){
                      status.value = false;
                    },
                    child: Text('Negativ',),
                  ),
                ],
              ),
              QRCodeButton(callback: (s){}, text: 'Testergnis QR-Code scannen')
            ],
          ),
        ),
    );
  }

}