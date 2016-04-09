library ebisu_py.ebisu_py;

import 'package:ebisu/ebisu.dart';
import 'package:id/id.dart';

// custom <additional imports>
// end <additional imports>

part 'src/ebisu_py/py_class.dart';
part 'src/ebisu_py/py_core.dart';
part 'src/ebisu_py/py_entity.dart';
part 'src/ebisu_py/py_member.dart';
part 'src/ebisu_py/py_namer.dart';

// custom <library ebisu_py>

String pydent(String text) => indentBlock(text, '    ');

// end <library ebisu_py>
