import 'Person.dart';

class PersonVisit {
  PersonVisit(
      {required this.person, required this.duration, required this.startTime});

  Person person;
  Duration duration;
  DateTime startTime;
}
