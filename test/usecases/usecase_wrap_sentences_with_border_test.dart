import 'package:sandbox_logger/sandbox_logger.dart';
import 'package:test/test.dart';

class _TestClass with UsecaseWrapSentencesWithBorder {}

void main() {
  final int maxHorizontalLenght = 80;
  final LogBorderSytle style = LogBorderSytle(
    topRightBorder: '╗',
    topLeftBorder: '╔',
    traceBorder: '═',
    middleRightBorder: '╠',
    middleLeftBorder: '╣',
    connectorLeftBorder: '╠',
    connectorRightBorder: '╣',
    bottomRightBorder: '╝',
    bottomLeftBorder: '╚',
  );
  final _TestClass usecase = _TestClass();

  test('Shold wrap single border text as expected', () async {
    final testText = ['This text', 'should be', 'as expected'].map((text) {
      return '  $text'.padRight(maxHorizontalLenght + 4);
    }).toList();
    final resultText = usecase
        .wrapSentenceWithBorder(
          sentences: testText,
          maxHorizontalLenght: maxHorizontalLenght,
          borderType: LogBorderType.single,
          borderSytle: style,
        )
        .map((line) => '$line\n')
        .toList()
        .join();

    final expectedText = '''
╔════════════════════════════════════════════════════════════════════════════════════╗
╠  This text                                                                         ╣
╠  should be                                                                         ╣
╠  as expected                                                                       ╣
╚════════════════════════════════════════════════════════════════════════════════════╝
''';
    expect(resultText, expectedText);
  });

  test('Shold wrap header border text as expected', () async {
    final testText = ['This text', 'should be', 'as expected'].map((text) {
      return '  $text'.padRight(maxHorizontalLenght + 4);
    }).toList();
    final resultText = usecase
        .wrapSentenceWithBorder(
          sentences: testText,
          maxHorizontalLenght: maxHorizontalLenght,
          borderType: LogBorderType.header,
          borderSytle: style,
        )
        .map((line) => '$line\n')
        .toList()
        .join();

    final expectedText = '''
╔════════════════════════════════════════════════════════════════════════════════════╗
╠  This text                                                                         ╣
╠  should be                                                                         ╣
╠  as expected                                                                       ╣
╠════════════════════════════════════════════════════════════════════════════════════╣
''';
    expect(resultText, expectedText);
  });

  test('Shold wrap middle border text as expected', () async {
    final testText = ['This text', 'should be', 'as expected'].map((text) {
      return '  $text'.padRight(maxHorizontalLenght + 4);
    }).toList();
    final resultText = usecase
        .wrapSentenceWithBorder(
          sentences: testText,
          maxHorizontalLenght: maxHorizontalLenght,
          borderType: LogBorderType.middle,
          borderSytle: style,
        )
        .map((line) => '$line\n')
        .toList()
        .join();

    final expectedText = '''
╠  This text                                                                         ╣
╠  should be                                                                         ╣
╠  as expected                                                                       ╣
╠════════════════════════════════════════════════════════════════════════════════════╣
''';
    expect(resultText, expectedText);
  });

  test('Shold wrap bottom border text as expected', () async {
    final testText = ['This text', 'should be', 'as expected'].map((text) {
      return '  $text'.padRight(maxHorizontalLenght + 4);
    }).toList();
    final resultText = usecase
        .wrapSentenceWithBorder(
          sentences: testText,
          maxHorizontalLenght: maxHorizontalLenght,
          borderType: LogBorderType.bottom,
          borderSytle: style,
        )
        .map((line) => '$line\n')
        .toList()
        .join();

    final expectedText = '''
╠  This text                                                                         ╣
╠  should be                                                                         ╣
╠  as expected                                                                       ╣
╚════════════════════════════════════════════════════════════════════════════════════╝
''';
    expect(resultText, expectedText);
  });
}
