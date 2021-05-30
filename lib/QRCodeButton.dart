import 'package:flutter/material.dart';
typedef StringCallback = void Function(String data);

class QRCodeButton extends StatelessWidget{
  QRCodeButton({Key? key, required this.callback, required this.text}): super(key: key);
  final StringCallback callback;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          //TODO replace with QR Code read
          callback('missing');
        },
        child: Text(text));
  }
}