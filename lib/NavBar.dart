import 'package:flutter/material.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  NavBar(this.title, {Key? key, this.implyLeading = true, this.actions})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);
  final String title;
  late final List<Widget>? actions;
  final bool implyLeading;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: implyLeading,
        title: Text(title),
        actions: actions != null ? actions : []);
  }
}
