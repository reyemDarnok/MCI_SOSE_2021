import 'package:flutter/material.dart';

class FAQElement extends StatefulWidget {
  FAQElement(this.title, this.content);

  final String title;
  final String content;

  @override
  State<StatefulWidget> createState() => FAQElementState(title, content);
}

class FAQElementState extends State<FAQElement> {
  FAQElementState(this.title, this.content);

  final String title;
  final String content;
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            expanded = !expanded;
          });
        },
        child: Center(child: expanded ? _expanded() : _closed()));
  }

  Row _closed() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(title), Icon(Icons.keyboard_arrow_right_rounded)]);
  }

  Column _expanded() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(title), Icon(Icons.keyboard_arrow_down_rounded)]),
        Text(content),
      ],
    );
  }
}
