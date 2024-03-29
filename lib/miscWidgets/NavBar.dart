import 'package:flutter/material.dart';
import 'package:mci_practicum/MainRoute.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  NavBar(this.title,
      {Key? key, this.implyLeading = true, this.actions, this.preTitle})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  final Widget? preTitle;
  final String title;
  late final List<Widget>? actions;
  final bool implyLeading;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: implyLeading,
        title: preTitle == null
            ? Text(title)
            : Row(
                children: [preTitle!, Text(title)],
              ),
        actions: actions != null
            ? actions
            : [
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil(
                          MainRoute.route, (route) => false),
                  child: Image.asset('assets/logo.png'),
                )
              ]);
  }
}
