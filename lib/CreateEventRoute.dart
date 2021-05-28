import 'package:flutter/material.dart';

import 'Event.dart';

class CreateEventRoute extends StatelessWidget {
  CreateEventRoute({Key? key, required this.update, required this.events})
      : super(key: key);
  final VoidCallback update;
  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    TextEditingController eventName = TextEditingController();
    TextEditingController minDuration = TextEditingController();
    return MaterialApp(
      title: 'Corona EventApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: BackButton(onPressed: () {Navigator.pop(context);},),
            title: Text('Neues Event'),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: eventName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: minDuration,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  //TODO error handling + feedback
                  events.add(new Event(
                      name: '${eventName.text}',
                      minDuration: double.parse(minDuration.text)));
                  update();
                },
                  child: Text('Erzeuge Event'))
              ]
          )
      ),
    );
  }

}