import 'package:logging/logging.dart';
import 'test_member.dart' as test_member;
import 'test_codeblock.dart' as test_codeblock;

main() {
  Logger.root.level = Level.OFF;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  test_member.main();
  test_codeblock.main();
}
