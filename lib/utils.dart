import 'package:built_value/serializer.dart';

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
