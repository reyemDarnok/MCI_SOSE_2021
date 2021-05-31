import 'dart:io' show Platform;

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

typedef StringCallback = void Function(String data);

class QRCodeButton extends StatelessWidget {
  QRCodeButton({Key? key, required this.callback, required this.text})
      : super(key: key);
  final StringCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
            ScanResult result = await BarcodeScanner.scan();
            if (result.type == ResultType.Barcode) {
              callback(result.rawContent);
            }
          } else {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              String content =
                  new String.fromCharCodes(result.files.first.bytes!);
              callback(content);
            }
          }
        },
        child: Text(text));
  }
}