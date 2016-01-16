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
    ..testLibraries = ([
      library('test_member'),
      library('test_codeblock'),
    ].map((l) => l..imports.add('../lib/ebisu_py.dart')).toList())
    ..libraries = [
      library('ebisu_py')
      ..defaultMemberAccess = RO
      ..imports = [
        'package:id/id.dart',
        'package:ebisu/ebisu.dart',
      ]
      ..parts = [

        part('py_core')
        ..enums = [
          enum_('access')
          ..doc = 'Set of access directives for members'
          ..values = [
            enumValue('ro')..doc = 'Read only',
            enumValue('rw')..doc = 'Read/write - effectively public',
            enumValue('wo')..doc = 'Write accessor but no read accessor',
            enumValue('ia')..doc = 'Inaccessible',
          ]
        ],

        part('py_entity')
        ..classes = [

          class_('py_entity')
          ..doc = 'Used to establish the tree of all python entities'
          ..mixins = [ 'Entity' ]
          ..isAbstract = true
          ..members = [
            member('id')
            ..type = 'Id'
          ],

          class_('installation')
          ..doc = 'Top level entity for python code generation'
          ..mixins = [ 'Entity' ]
          ..members = [
            member('packages')
            ..type = 'List<Package>'..classInit = [],
          ],

          class_('package')
          ..mixins = [ 'Entity' ]
          ..members = [
            member('modules')..classInit = [],
          ],

          class_('module')
          ..mixins = [ 'Entity' ]
          ..members = [
            member('classes')..classInit = [],
          ],

        ],

        part('py_member')
        ..classes = [
          class_('member')
          ..doc = '''
An accessible data item in a class.
'''
          ..extend = 'PyEntity'
          ..members = [
            member('init')
            ..doc = 'Initialization for the member',
            member('access')
            ..type = 'Access',
            member('type')
            ..access = IA
            ..doc = 'Optional type for the member',
            member('vname')
            ..doc = 'Variable name derived from *id*',
          ]
        ],

        part('py_class')
        ..classes = [
          class_('class')
          ..doc = 'A python class'
          ..extend = 'PyEntity'
          ..members = [
            member('members')
            ..doc = 'The members of the class'
            ..type = 'List<Members>'..classInit = [],
          ]
        ],

      ],
    ];

  ebisu.generate();
}
