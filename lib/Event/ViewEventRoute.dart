import 'package:flutter/material.dart';

import 'Event.dart';

class ViewEventRoute extends StatelessWidget {
  ViewEventRoute({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona EventApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Event ${event.name}'),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Minimale Verweildauer: ${event.minDuration}'),
                //TODO replace noop with navigation
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                        'Manuelle Teilnehmer: ${event.manualVisitors.length}')),
                ElevatedButton(
                    //TODO replace noop with navigation
                    onPressed: () {},
                    child: Text('Manuelle Teilnehmer hinzufügen')),
                //TODO replace with QR Code
                Text('Here should be a QR Code'),
                ElevatedButton(
                    //TODO onPressed shares the QR Code
                    onPressed: () {},
                    child: Text('QR Code teilen')),
              ]))),
    );
  }
}
