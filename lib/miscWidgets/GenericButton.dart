import 'package:flutter/material.dart';

import '../sizes.dart';

class GenericButton extends StatelessWidget {
  GenericButton({required this.onPressed, required this.child});

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: buttonWidth(context),
        child: ElevatedButton(
          onPressed: onPressed,
          child: child,
        ));
  }
}
