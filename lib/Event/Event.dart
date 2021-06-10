import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import '../Person.dart';

part 'Event.g.dart';

@JsonSerializable()
class Event {
  @JsonKey(ignore: true)
  static Uuid uuid = Uuid();

  Event({required this.name, required this.minDuration, manualVisitors}) {
    this.manualVisitors = List.empty(growable: true);
    unique = uuid.v4();
  }

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  @JsonKey(ignore: true)
  late final List<Person> manualVisitors;
  late String unique;
  String name;
  Duration minDuration;
}
