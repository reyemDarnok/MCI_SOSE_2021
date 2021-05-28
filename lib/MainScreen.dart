import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mci_practicum/StatusWidget.dart';
import 'package:mci_practicum/TestEntryScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> status = ValueNotifier(false);
    return MaterialApp(
      title: 'Corona EventApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Corona EventApp'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatusWidget(status: status),
                ],
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestEntryScreen(status: status,))
                  );
                },
                child: Text('Testergebns eingeben'),
              ),
              Text('\n\n'),
              ElevatedButton(
                onPressed: (){
                  print("more test");
                },
                child: Text('QR-Code scannen')
              )
            ],
          ),
        ),
      ),
    );
  }

}