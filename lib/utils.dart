import 'dart:convert';
import 'dart:typed_data';

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

RSAPrivateKey deserializeRSAPrivateKey(Object? serialized) {
  if (serialized == null) {
    throw FormatException('Serialized Object is null');
  }
  var map = serialized as Map<String, dynamic>;
  if (!map.containsKey('modulus') ||
      !map.containsKey('privateExponent') ||
      !map.containsKey('p') ||
      !map.containsKey('q')) {
    throw FormatException('Format does no match RSA private Key');
  }
  return RSAPrivateKey(
    readBytes(base64Decode(map['modulus'])),
    readBytes(base64Decode(map['privateExponent'])),
    readBytes(base64Decode(map['p'])),
    readBytes(base64Decode(map['q'])),
  );
}

Map<String, dynamic> serializeRSAPrivateKey(RSAPrivateKey object) {
  return {
    'modulus': base64Encode(writeBigInt(object.modulus!)),
    'privateExponent': base64Encode(writeBigInt(object.privateExponent!)),
    'p': base64Encode(writeBigInt(object.p!)),
    'q': base64Encode(writeBigInt(object.q!))
  };
}

RSAPublicKey deserializeRSAPublicKey(Object? serialized) {
  if (serialized == null) {
    throw FormatException('Serialized Object is null');
  }
  var map = serialized as Map<String, dynamic>;
  if (!map.containsKey('modulus') || !map.containsKey('exponent')) {
    throw FormatException('Format does no match RSA public Key');
  }
  return RSAPublicKey(
    readBytes(base64Decode(map['modulus'])),
    readBytes(base64Decode(map['exponent'])),
  );
}

@override
Map<String, dynamic> serializeRSAPublicKey(RSAPublicKey object) {
  return {
    'modulus': base64Encode(writeBigInt(object.modulus!)),
    'exponent': base64Encode(writeBigInt(object.exponent!)),
  };
}

BigInt readBytes(Uint8List bytes) {
  BigInt read(int start, int end) {
    if (end - start <= 4) {
      int result = 0;
      for (int i = end - 1; i >= start; i--) {
        result = result * 256 + bytes[i];
      }
      return new BigInt.from(result);
    }
    int mid = start + ((end - start) >> 1);
    var result =
        read(start, mid) + read(mid, end) * (BigInt.one << ((mid - start) * 8));
    return result;
  }

  return read(0, bytes.length);
}

Uint8List writeBigInt(BigInt number) {
  // Not handling negative numbers. Decide how you want to do that.
  int bytes = (number.bitLength + 7) >> 3;
  var b256 = new BigInt.from(256);
  var result = new Uint8List(bytes);
  for (int i = 0; i < bytes; i++) {
    result[i] = number.remainder(b256).toInt();
    number = number >> 8;
  }
  return result;
}
