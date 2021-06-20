import 'dart:math';

import 'package:flutter/material.dart';

double buttonWidth(BuildContext context) {
  var mediaSize = MediaQuery.of(context).size;
  if (mediaSize.width > mediaSize.height) {
    //landscape
    return mediaSize.width * 0.2;
  } else {
    //portrait
    return min(mediaSize.width * 0.8, qrCodeButtonWidth(context));
  }
}

double qrCodeButtonWidth(BuildContext context) {
  Size mediaSize = MediaQuery.of(context).size;
  double widthSuggestion = mediaSize.width * 0.8;
  double heightSuggestion = mediaSize.height * 0.4;
  return min(widthSuggestion, heightSuggestion);
}

double qrCodeWidth(BuildContext context) {
  Size mediaSize = MediaQuery.of(context).size;
  double widthSuggestion = mediaSize.width * 0.4;
  double heightSuggestion = mediaSize.height * 0.2;
  return min(widthSuggestion, heightSuggestion);
}
