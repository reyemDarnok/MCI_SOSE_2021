import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'Event/Event.dart';
import 'Person.dart';
import 'PropertyValueNotifier.dart';
import 'logger_outputs.dart';

ValueNotifier<Locale> appLocale = ValueNotifier(Locale('en'));
PropertyValueNotifier<List<PropertyValueNotifier<Event>>> events =
    PropertyValueNotifier(List.empty(growable: true));
Person me = Person(street: '', telephone: '', name: '', city: '');

Future<Logger> getLogger() async {
  return Logger(
      output: MultiOutput([ConsoleOutput(), _webFileOutput]),
      printer:
          PrettyPrinter(printTime: true, colors: false, printEmojis: false));
}

RetainOutput _webFileOutput = RetainOutput();

String getWebLog() {
  return _webFileOutput.content;
}

late Logger log;
