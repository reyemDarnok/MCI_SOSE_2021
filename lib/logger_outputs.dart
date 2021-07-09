
import 'package:logger/logger.dart';

class RetainOutput extends LogOutput {
  String get content {
    return _list.join('\n');
  }

  List<String> _list = new List.empty(growable: true);

  @override
  void output(OutputEvent event) {
    _list.addAll(event.lines);
  }
}

class PassAll extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
