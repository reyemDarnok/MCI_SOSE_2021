import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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
      output: kIsWeb
          ? MultiOutput([ConsoleOutput(), _webFileOutput])
          : MultiOutput([
              ConsoleOutput(),
              FileOutput(
                  file: File(join(
                      (await getApplicationDocumentsDirectory()).path,
                      'logfile.log')))
            ]),
      printer:
          PrettyPrinter(printTime: true, colors: false, printEmojis: false));
}

RetainOutput _webFileOutput = RetainOutput();

String getWebLog() {
  return _webFileOutput.content;
}

Future<File> getLog() async {
  return File(
      join((await getApplicationDocumentsDirectory()).path, 'logfile.log'));
}

late Logger log;
