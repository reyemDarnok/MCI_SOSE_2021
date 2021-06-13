import 'Event.dart';

class EventVisit {
  EventVisit(
      {required this.event, required this.start, required this.visitDuration});

  Event event;
  Duration visitDuration;
  DateTime start;
}
