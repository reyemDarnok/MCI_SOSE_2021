import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'PropertyValueNotifier.dart';
import 'logger_outputs.dart';
import 'miscTypes/AuthorisedEvent.dart';
import 'miscTypes/EventVisit.dart';

//null == System Locale
ValueNotifier<Locale?> appLocale = ValueNotifier(null);

PropertyValueNotifier<List<PropertyValueNotifier<AuthorisedEvent>>> ownEvents =
    PropertyValueNotifier(List.empty(growable: true));
PropertyValueNotifier<List<PropertyValueNotifier<EventVisit>>> visitedEvents =
    PropertyValueNotifier(List.empty(growable: true));

RetainOutput _webFileOutput = RetainOutput();

String getWebLog() {
  return _webFileOutput.content;
}

ValueNotifier<bool> status = ValueNotifier(false);

Logger log = Logger(
    filter: PassAll(),
    output: MultiOutput([ConsoleOutput(), _webFileOutput]),
    printer: PrettyPrinter(printTime: true, colors: false, printEmojis: false));
