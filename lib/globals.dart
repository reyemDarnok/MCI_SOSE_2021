import 'dart:ui';

import 'package:flutter/material.dart';

import 'Event/Event.dart';
import 'Person.dart';

ValueNotifier<Locale> appLocale = ValueNotifier(Locale('en'));
List<Event> events = List.empty(growable: true);
Person me = Person(street: '', telephone: '', name: '', city: '');
