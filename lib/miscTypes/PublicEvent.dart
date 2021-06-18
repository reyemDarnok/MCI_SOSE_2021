import 'package:json_annotation/json_annotation.dart';
import 'package:mci_practicum/miscTypes/AuthorisedEvent.dart';
import "package:pointycastle/export.dart";
import 'package:uuid/uuid.dart';

import '../utils.dart';

part 'PublicEvent.g.dart';

@JsonSerializable()
class PublicEvent {
  @JsonKey(ignore: true)
  static Uuid uuid = Uuid();

  PublicEvent();

  factory PublicEvent.fromJson(Map<String, dynamic> json) =>
      _$PublicEventFromJson(json);

  factory PublicEvent.fromAuthorisedEvent(AuthorisedEvent authorisedEvent) {
    var result = PublicEvent();
    result.publicKey = authorisedEvent.publicKey;
    result.unique = authorisedEvent.unique;
    result.name = authorisedEvent.name;
    result.minDuration = authorisedEvent.minDuration;
    return result;
  }

  Map<String, dynamic> toJson() => _$PublicEventToJson(this);

  @JsonKey(fromJson: deserializeRSAPublicKey, toJson: serializeRSAPublicKey)
  late RSAPublicKey publicKey;
  late String unique;
  late String name;

  late Duration minDuration;
}
