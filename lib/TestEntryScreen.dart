import 'package:flutter/material.dart';

class TestEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona EventApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => Navigator.of(context).pop(),),
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
                      onPressed: (){},
                      child: Text('Positiv',
                          style: TextStyle(color: Colors.red))),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('Negativ',
                          style: TextStyle(color: Colors.green)))
                ],
              )
            ],
          ),
        ),
      ),
    );

  }

}