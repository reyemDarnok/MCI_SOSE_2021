import 'dart:io' show Platform;

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:mci_practicum/sizes.dart';

import '../globals.dart';

typedef StringCallback = void Function(String data);

class QRCodeButton extends StatelessWidget {
  QRCodeButton({Key? key, required this.callback, required this.text})
      : super(key: key);
  final StringCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: qrCodeButtonWidth(context),
        height: qrCodeButtonWidth(context),
        child: ElevatedButton(
            onPressed: () async {
              if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
                await _scanQRCode();
              } else {
                await _getFile();
              }
            },
            child: Container(
                width: qrCodeButtonWidth(context) * 0.9,
                height: qrCodeButtonWidth(context) * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/qrCodeBackground.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(child: Text(text)))));
  }

  Future<void> _getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String content = String.fromCharCodes(result.files.first.bytes!);
      callback(content);
      log.d('Scanned code: ' + content);
    } else {
      log.d('Scanning aborted');
    }
  }

  Future<void> _scanQRCode() async {
    ScanResult result = await BarcodeScanner.scan();
    if (result.type == ResultType.Barcode) {
      callback(result.rawContent);
      log.d('Scanned code: ' + result.rawContent);
    } else {
      log.d('Scanning aborted');
    }
  }
}
