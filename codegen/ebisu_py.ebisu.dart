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
      ..defaultMemberAccess = RO
      ..imports = [
        'package:id/id.dart',
        'package:ebisu/ebisu.dart',
      ]
      ..parts = [

        part('py_entity')
        ..classes = [
          class_('py_entity')
          ..mixins = [ 'Entity' ]
          ..isAbstract = true
          ..members = [
            member('id')
            ..type = 'Id'
          ]
        ],

        part('py_member')
        ..classes = [
          class_('member')
          ..extend = 'PyEntity'
          ..members = [
            member('init')
            ..doc = 'Initialization for the member',
            member('access')
            ..type = 'Access',
          ]
        ],

        part('py_class')
        ..classes = [
          class_('class')
          ..extend = 'PyEntity'
          ..members = [
            member('members')..type = 'List<Members>'..classInit = [],
          ]
        ],

      ],
    ];

  ebisu.generate();
}
