import 'package:flutter/material.dart';

import '../Person.dart';

class ViewPersonRoute extends StatelessWidget {
  ViewPersonRoute({Key? key, required this.person}) : super(key: key);
  final Person person;

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
            title: Text(person.name),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Name:'),
                Text(person.name),
                Text('Telefonnummer:'),
                Text(person.telephone),
                Text('Straße, Hausnummer:'),
                Text(person.street),
                Text('PLZ Stadt:'),
                Text(person.city),
              ]))),
    );
  }
}
