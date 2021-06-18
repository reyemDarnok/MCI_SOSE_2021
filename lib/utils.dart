import 'package:built_value/serializer.dart';
import 'package:pointycastle/asymmetric/api.dart';

class DurationSerializer implements PrimitiveSerializer<Duration> {
  @override
  Duration deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return Duration(microseconds: serialized as int);
  }

  @override
  Object serialize(Serializers serializers, Duration object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.inMicroseconds;
  }

  @override
  final Iterable<Type> types = [Duration];

  @override
  final String wireName = 'Duration';
}

RSAPrivateKey deserializeRSAPrivateKey(Object serialized) {
  var map = serialized as Map<String, dynamic>;
  return RSAPrivateKey(
      BigInt.parse(map['modulus']),
      BigInt.parse(map['privateExponent']),
      BigInt.parse(map['p']),
      BigInt.parse(map['q']));
}

Map<String, dynamic> serializeRSAPrivateKey(RSAPrivateKey object) {
  return {
    'modulus': object.modulus.toString(),
    'privateExponent': object.privateExponent.toString(),
    'p': object.p.toString(),
    'q': object.q.toString()
  };
}

RSAPublicKey deserializeRSAPublicKey(Object serialized) {
  var map = serialized as Map<String, dynamic>;
  return RSAPublicKey(
    BigInt.parse(map['modulus']),
    BigInt.parse(map['exponent']),
  );
}

@override
Map<String, dynamic> serializeRSAPublicKey(RSAPublicKey object) {
  return {
    'modulus': object.modulus.toString(),
    'exponent': object.exponent.toString(),
  };
}
