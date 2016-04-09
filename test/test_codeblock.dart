library ebisu_py.test_codeblock;

import '../lib/ebisu_py.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

// custom <additional imports>
import 'package:ebisu/ebisu.dart';
// end <additional imports>

final _logger = new Logger('test_codeblock');

// custom <library test_codeblock>
// end <library test_codeblock>

main([List<String> args]) {
  Logger.root.onRecord.listen(
      (LogRecord r) => print("${r.loggerName} [${r.level}]:\t${r.message}"));
  Logger.root.level = Level.OFF;
// custom <main>

  test('custom block', () {
    print('''
def foo():
${pydent(scriptCustomBlock('foo cust'))}
''');
  });

// end <main>
}
