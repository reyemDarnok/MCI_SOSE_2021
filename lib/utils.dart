import 'package:built_value/serializer.dart';

Duration parseDuration(String input, {String separator = ','}) {
  final parts = input.split(separator).map((t) => t.trim()).toList();

  int? days;
  int? hours;
  int? minutes;
  int? seconds;
  int? milliseconds;
  int? microseconds;

  for (String part in parts) {
    final match = RegExp(r'^(\d+)(d|h|m|s|ms|us)$').matchAsPrefix(part);
    if (match == null) throw FormatException('Invalid duration format');

    int value = int.parse(match.group(1)!);
    String? unit = match.group(2);

    switch (unit) {
      case 'd':
        if (days != null) {
          throw FormatException('Days specified multiple times');
        }
        days = value;
        break;
      case 'h':
        if (hours != null) {
          throw FormatException('Hours specified multiple times');
        }
        hours = value;
        break;
      case 'm':
        if (minutes != null) {
          throw FormatException('Minutes specified multiple times');
        }
        minutes = value;
        break;
      case 's':
        if (seconds != null) {
          throw FormatException('Seconds specified multiple times');
        }
        seconds = value;
        break;
      case 'ms':
        if (milliseconds != null) {
          throw FormatException('Milliseconds specified multiple times');
        }
        milliseconds = value;
        break;
      case 'us':
        if (microseconds != null) {
          throw FormatException('Microseconds specified multiple times');
        }
        microseconds = value;
        break;
      default:
        throw FormatException('Invalid duration unit $unit');
    }
  }

  return Duration(
      days: days ?? 0,
      hours: hours ?? 0,
      minutes: minutes ?? 0,
      seconds: seconds ?? 0,
      milliseconds: milliseconds ?? 0,
      microseconds: microseconds ?? 0);
}

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
