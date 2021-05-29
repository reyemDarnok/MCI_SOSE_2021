import 'package:flutter/material.dart';

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Einstellungen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO Language change
            ElevatedButton(onPressed: () {}, child: Text('Sprache')),
            //TODO Personal Data
            ElevatedButton(
              onPressed: () {},
              child: Text('Persönliche Daten'),
            ),
            //TODO Internal Workings
            ElevatedButton(
                onPressed: () {}, child: Text('Interne Arbeitsweise'))
          ],
        ),
      ),
    );
  }
}
