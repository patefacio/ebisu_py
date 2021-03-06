import 'package:logging/logging.dart';
import 'test_namer.dart' as test_namer;
import 'test_class.dart' as test_class;
import 'test_member.dart' as test_member;
import 'test_codeblock.dart' as test_codeblock;

void main() {
  Logger.root.level = Level.OFF;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  test_namer.main(null);
  test_class.main(null);
  test_member.main(null);
  test_codeblock.main(null);
}
