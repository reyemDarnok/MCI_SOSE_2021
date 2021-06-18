import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';
import 'package:mci_practicum/miscWidgets/GenericButton.dart';

import '../../globals.dart';
import '../../miscTypes/AuthorisedEvent.dart';
import '../../miscWidgets/NavBar.dart';
import 'CreateEventRoute.dart';
import 'ViewEventRoute.dart';

class OwnEventsRoute extends StatelessWidget {
  static const String route = '/events/own';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(AppLocalizations.of(context)!.ownEvents),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          _newEventButton(context),
          _eventList(),
        ]));
  }

  Expanded _eventList() {
    return Expanded(
      child:
          ValueListenableBuilder<List<PropertyValueNotifier<AuthorisedEvent>>>(
              valueListenable: ownEvents,
              builder: (context, status, child) {
                return ListView.builder(
                    itemCount: status.length,
                    itemBuilder: (context, index) {
                      return _eventTile(context, index);
                    });
              }),
    );
  }

  Widget _eventTile(BuildContext context, int index) {
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(ViewEventRoute.route,
          arguments: ViewEventRouteArguments(ownEvents.value[index])),
      title: Text(ownEvents.value[index].value.name),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                      title: Text(AppLocalizations.of(context)!
                          .reallyDelete(ownEvents.value[index].value.name)),
                      children: [
                        SimpleDialogOption(
                            onPressed: () {
                              ownEvents.value.removeAt(index);
                              ownEvents.notifyListeners();
                              Navigator.of(context).pop();
                            },
                            child: Text(AppLocalizations.of(context)!.yes)),
                        SimpleDialogOption(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(AppLocalizations.of(context)!.no))
                      ]));
        },
      ),
    );
  }

  GenericButton _newEventButton(BuildContext context) {
    return GenericButton(
        onPressed: () => Navigator.of(context).pushNamed(
              CreateEventRoute.route,
            ),
        child: Text(AppLocalizations.of(context)!.createNewEvent));
  }
}
