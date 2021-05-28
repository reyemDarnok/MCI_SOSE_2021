import 'package:flutter/material.dart';

class CreateEventRoute extends StatelessWidget{
  CreateEventRoute({Key? key, required this.update, required this.events}): super(key: key);
  final VoidCallback update;
  final List<String> events;

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
                  onPressed: (){
                    events.add('${eventName.text} : ${minDuration.text}');
                    update();
                  },
                  child: Text('Erzeuge Event'))
              ]
          )
      ),
    );
  }

}