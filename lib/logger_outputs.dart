import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:universal_html/html.dart' as html;

/// Writes the log output to a file.
class FileOutput extends LogOutput {
  final File file;
  final bool overrideExisting;
  final Encoding encoding;
  IOSink? _sink;

  FileOutput({
    required this.file,
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  @override
  void init() {
    _sink = file.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  void output(OutputEvent event) {
    _sink?.writeAll(event.lines, '\n');
  }

  @override
  void destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}

class WebFileOutput extends LogOutput {
  final String name;
  late html.File file;

  WebFileOutput({
    required this.name,
  }) {
    file = html.File([], name);
  }

  @override
  void output(OutputEvent event) {
    List<Object> content = [file];
    content.addAll(event.lines);
    file = html.File(content, name);
  }
}
