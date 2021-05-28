import 'package:flutter/material.dart';

class OwnEventsRoute extends StatelessWidget{
  final List<String> events = new List.generate(5,(i){return "$i";});
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
          title: Text('Eigene Events'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO remove noop
              ElevatedButton(onPressed: (){}, child: Text('Event erstellen')),
              ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(events[index]),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );

  }

}