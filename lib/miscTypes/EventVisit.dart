import 'PublicEvent.dart';

class EventVisit {
  EventVisit(
      {required this.event, required this.start, required this.visitDuration});

  PublicEvent event;
  Duration visitDuration;
  DateTime start;
}
