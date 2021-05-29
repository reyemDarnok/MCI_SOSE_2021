import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mci_practicum/Event/OwnEventsRoute.dart';
import 'package:mci_practicum/QRCodeButton.dart';
import 'package:mci_practicum/StatusWidget.dart';
import 'package:mci_practicum/TestEntryRoute.dart';

class MainRoute extends StatelessWidget {
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
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OwnEventsRoute())
                      );},
                      child: Text('Eigene Events',
                        style: TextStyle(color: Colors.black)
                      )
                    ),
                  ),
                  PopupMenuItem(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                        ),
                        //TODO Settings page
                            onPressed: (){},
                        child: Text('Settings',
                            style: TextStyle(color: Colors.black)
                        )
                    ),
                  ),
                  PopupMenuItem(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                        ),
                        //TODO FAQ page
                            onPressed: (){},
                        child: Text('FAQ',
                            style: TextStyle(color: Colors.black)
                        )
                    ),
                  ),
                ]
              )
            ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StatusWidget(status: status),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestEntryRoute(status: status,))
                  );
                },
                child: Text('Testergebns eingeben'),
              ),
              Text('\n\n'),
              QRCodeButton(
                  callback: (s){},
                  text: 'QR-Code scannen'),
            ],
          ),
        ),
      ),
    );
  }

}