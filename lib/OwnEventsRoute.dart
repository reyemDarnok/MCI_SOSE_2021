import 'package:flutter/material.dart';

class OwnEventsRoute extends StatelessWidget{
  final List<String> events = new List.generate(5,(i){return "Event Name $i";});
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO replace noop with navigation
            ElevatedButton(onPressed: (){}, child: Text('Neues Event erstellen')),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: events.length,
                itemBuilder: (context, index) {
                  //TODO replace noop with navigation
                  return Center(
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Text(events[index])
                      )
                  );
                }
              )
            )
          ]
        )
      ),
    );

  }

}