import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Event/Event.dart';
import 'Person.dart';
import 'PropertyValueNotifier.dart';

ValueNotifier<Locale> appLocale = ValueNotifier(Locale('en'));
PropertyValueNotifier<List<PropertyValueNotifier<Event>>> events =
    PropertyValueNotifier(List.empty(growable: true));
Person me = Person(street: '', telephone: '', name: '', city: '');
