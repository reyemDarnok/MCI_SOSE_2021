import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'Event/Event.dart';
import 'Event/EventVisit.dart';
import 'Person.dart';
import 'PropertyValueNotifier.dart';
import 'logger_outputs.dart';

//null == System Locale
ValueNotifier<Locale?> appLocale = ValueNotifier(null);

PropertyValueNotifier<List<PropertyValueNotifier<Event>>> ownEvents =
    PropertyValueNotifier(List.empty(growable: true));
PropertyValueNotifier<List<PropertyValueNotifier<EventVisit>>> visitedEvents =
    PropertyValueNotifier(List.empty(growable: true));

Person me = Person(street: '', telephone: '', name: '', city: '');

RetainOutput _webFileOutput = RetainOutput();

String getWebLog() {
  return _webFileOutput.content;
}

Logger log = Logger(
    output: MultiOutput([ConsoleOutput(), _webFileOutput]),
    printer: PrettyPrinter(printTime: true, colors: false, printEmojis: false));
