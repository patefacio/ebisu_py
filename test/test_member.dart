library ebisu_py.test_member;

import '../lib/ebisu_py.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

// custom <additional imports>
// end <additional imports>

final Logger _logger = new Logger('test_member');

// custom <library test_member>
// end <library test_member>

void main([List<String> args]) {
  if (args?.isEmpty ?? false) {
    Logger.root.onRecord.listen(
        (LogRecord r) => print("${r.loggerName} [${r.level}]:\t${r.message}"));
    Logger.root.level = Level.OFF;
  }
// custom <main>

  group('member definition', () {
    final m = member('foo')..doc = 'This is a foo';
    print(m.definition);
  });

// end <main>
}
