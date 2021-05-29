import 'package:flutter/material.dart';

import '../globals.dart';
import 'EventForm.dart';

class CreateEventRoute extends StatelessWidget {
  CreateEventRoute({
    Key? key,
    required this.update,
  }) : super(key: key);
  final VoidCallback update;

  @override
  Widget build(BuildContext context) {
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
          body: EventForm(
            callback: (event) {
              events.add(event);
              update();
            },
          )),
    );
  }

}