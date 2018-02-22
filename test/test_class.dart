library ebisu_py.test_class;

import '../lib/ebisu_py.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

// custom <additional imports>
// end <additional imports>

final Logger _logger = new Logger('test_class');

// custom <library test_class>
// end <library test_class>

void main([List<String> args]) {
  if (args?.isEmpty ?? false) {
    Logger.root.onRecord.listen(
        (LogRecord r) => print("${r.loggerName} [${r.level}]:\t${r.message}"));
    Logger.root.level = Level.OFF;
  }
// custom <main>

  test('class basics', () {
    final cls = new Class('x_y_z');
    print(cls.definition);
  });

// end <main>
}
