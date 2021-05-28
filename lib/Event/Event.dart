import 'package:uuid/uuid.dart';

import '../Person.dart';

class Event {
  static Uuid uuid = Uuid();

  Event({required this.name, required this.minDuration, manualVisitors}) {
    this.manualVisitors = List.empty(growable: true);
  }

  late final List<Person> manualVisitors;
  final String unique = uuid.v4();
  final String name;
  final num minDuration;
}
