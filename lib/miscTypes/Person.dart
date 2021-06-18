import 'package:json_annotation/json_annotation.dart';

part 'Person.g.dart';

@JsonSerializable()
class Person {
  Person(
      {required this.name,
      required this.telephone,
      required this.street,
      required this.city});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  String name;
  String telephone;
  String street;
  String city;
}
