import 'dart:math';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:mci_practicum/PropertyValueNotifier.dart';
import 'package:mci_practicum/utils.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/key_generators/api.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:uuid/uuid.dart';

import 'PersonVisit.dart';

part 'AuthorisedEvent.g.dart';

@JsonSerializable()
class AuthorisedEvent {
  @JsonKey(ignore: true)
  static Uuid uuid = Uuid();

  AuthorisedEvent({required this.name, required this.minDuration}) {
    this.manualVisitors = List.empty(growable: true);
    unique = uuid.v4();
  }

  void initKeys() {
    var keyPair = getRsaKeyPair(getSecureRandom());
    publicKey = keyPair.publicKey as RSAPublicKey;
    privateKey = keyPair.privateKey as RSAPrivateKey;
  }

  factory AuthorisedEvent.fromJson(Map<String, dynamic> json) =>
      _$AuthorisedEventFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorisedEventToJson(this);

  @JsonKey(ignore: true)
  late final List<PropertyValueNotifier<PersonVisit>> manualVisitors;
  @JsonKey(fromJson: deserializeRSAPrivateKey, toJson: serializeRSAPrivateKey)
  late RSAPrivateKey privateKey;
  @JsonKey(fromJson: deserializeRSAPublicKey, toJson: serializeRSAPublicKey)
  late RSAPublicKey publicKey;
  late String unique;
  String name;
  Duration minDuration;
}

SecureRandom getSecureRandom() {
  var secureRandom = FortunaRandom();
  var random = Random.secure();
  List<int> seeds = [];
  for (int i = 0; i < 32; i++) {
    seeds.add(random.nextInt(255));
  }
  secureRandom.seed(new KeyParameter(new Uint8List.fromList(seeds)));
  return secureRandom;
}

AsymmetricKeyPair<PublicKey, PrivateKey> getRsaKeyPair(
    SecureRandom secureRandom) {
  var rsaParameters =
      new RSAKeyGeneratorParameters(BigInt.from(65537), 1024, 5);
  var params = new ParametersWithRandom(rsaParameters, secureRandom);
  var keyGenerator = new RSAKeyGenerator();
  keyGenerator.init(params);
  return keyGenerator.generateKeyPair();
}
