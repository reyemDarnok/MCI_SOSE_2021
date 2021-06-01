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

Future<Logger> getLogger(String name) async {
  return Logger(
    output: kIsWeb
        ? MultiOutput([ConsoleOutput(), WebFileOutput(name: 'logfile.log')])
        : MultiOutput([
            ConsoleOutput(),
            FileOutput(
                file: File(join((await getApplicationDocumentsDirectory()).path,
                    'logfile.log'))),
          ]),
    printer: PrettyPrinter(
      lineLength: 90,
      colors: false,
      methodCount: 1,
      errorMethodCount: 5,
    ),
  );
}
