library ebisu_py.test_namer;

import '../lib/ebisu_py.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

// custom <additional imports>

import 'package:ebisu/ebisu.dart';

// end <additional imports>

final _logger = new Logger('test_namer');

// custom <library test_namer>
// end <library test_namer>

main([List<String> args]) {
  Logger.root.onRecord.listen(
      (LogRecord r) => print("${r.loggerName} [${r.level}]:\t${r.message}"));
  Logger.root.level = Level.OFF;
// custom <main>

  test('PyNamer', () {
    final sampleId = makeId('one_two_three');
    final namer = new PyNamer();

    expect(namer.nameFunction(sampleId), 'one_two_three');
    expect(namer.nameMethod(sampleId), 'one_two_three');
    expect(namer.nameAttribute(sampleId), 'one_two_three');
    expect(namer.nameAttribute(sampleId, internal), '_one_two_three');
    expect(namer.nameAttribute(sampleId, private), '__one_two_three');

    expect(nameFunction(sampleId), 'one_two_three');
    expect(nameMethod(sampleId), 'one_two_three');
    expect(nameAttribute(sampleId), 'one_two_three');
    expect(nameAttribute(sampleId, internal), '_one_two_three');
    expect(nameAttribute(sampleId, private), '__one_two_three');

  });

  test('library namer', () {
    expect(pyNamer == null, false);
  });

// end <main>
}
