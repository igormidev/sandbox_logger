import 'package:sandbox_logger/sandbox_logger.dart';
import 'package:test/test.dart';

class _TestModel with UsecaseFormatStackTraceToLines {}

void main() {
  final _TestModel usecase = _TestModel();
  test('Should show error as expected', () async {
    final stack = StackTrace.fromString(stackText);
    final response = usecase
        .getFormatedStringLinesFromStackTrace(stackTrace: stack)
        .map((e) => '$e\n')
        .join();

    expect(response, expected);
  });
}

final stackText = '''
#0      double.parse (dart:core-patch/double_patch.dart:112:28)
#1      main.<anonymous closure> (file:///home/igor/sandbox_logger/test/usecases/usecase_format_stack_trace_to_lines_test.dart:13:14)
#2      Declarer.test.<anonymous closure>.<anonymous closure> (package:test_api/src/backend/declarer.dart:215:19)
<asynchronous suspension>
#3      Declarer.test.<anonymous closure> (package:test_api/src/backend/declarer.dart:213:7)
<asynchronous suspension>
#4      Invoker._waitForOutstandingCallbacks.<anonymous closure> (package:test_api/src/backend/invoker.dart:258:9)
<asynchronous suspension>
''';

final expected = '''
#0 double.parse 
(dart:core-patch/double_patch.dart:112:28)
#1 main.<anonymous closure> 
(file:///home/igor/sandbox_logger/test/usecases/usecase_format_stack_trace_to_lines_test.dart:13:14)
#2 Declarer.test.<anonymous closure>.<anonymous closure> 
(package:test_api/src/backend/declarer.dart:215:19)
#3 <asynchronous suspension>
#4 Declarer.test.<anonymous closure> 
(package:test_api/src/backend/declarer.dart:213:7)
#5 <asynchronous suspension>
#6 Invoker._waitForOutstandingCallbacks.<anonymous closure> 
(package:test_api/src/backend/invoker.dart:258:9)
#7 <asynchronous suspension>
''';
