import "dart:io";
import "package:path/path.dart" as path;
import "package:ebisu/ebisu.dart";
import "package:ebisu/ebisu_dart_meta.dart";
import "package:logging/logging.dart";

String _topDir;

final _logger = new Logger('ebisu_py');

void main() {
  Logger.root.onRecord.listen(
      (LogRecord r) => print("${r.loggerName} [${r.level}]:\t${r.message}"));
  String here = path.absolute(Platform.script.toFilePath());

  Logger.root.level = Level.OFF;
  useDartFormatter = true;
  _topDir = path.dirname(path.dirname(here));
  System ebisu = system('ebisu_py')
    ..includesHop = true
    ..license = 'boost'
    ..pubSpec.homepage = 'https://github.com/patefacio/ebisu_py'
    ..pubSpec.version = '0.0.1'
    ..rootPath = _topDir
    ..doc = 'Support library for generating python code'
    ..libraries = [
      library('ebisu_py')
      ..parts = [
        part('py_class')
        ..classes = [
          class_('class')
        ]
      ],
    ];

  ebisu.generate();
}
