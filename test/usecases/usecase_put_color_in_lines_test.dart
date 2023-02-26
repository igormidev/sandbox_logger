import 'package:sandbox_logger/sandbox_logger.dart';
import 'package:test/test.dart';

class _TestModel with UsecasePutColorInLines {}

void main() {
  final _TestModel usecase = _TestModel();

  test(
      'Shold put the color string in the '
      'start and reset color in the final in each color', () async {
    final use = usecase.putColorInEachLine;
    final greenList = use(lines: _fakeList, color: LogColor.green);
    final blackList = use(lines: _fakeList, color: LogColor.black);
    final whiteList = use(lines: _fakeList, color: LogColor.white);
    final redList = use(lines: _fakeList, color: LogColor.red);
    final yellowList = use(lines: _fakeList, color: LogColor.yellow);
    final blueList = use(lines: _fakeList, color: LogColor.blue);
    final cyanList = use(lines: _fakeList, color: LogColor.cyan);
    final magentaList = use(lines: _fakeList, color: LogColor.magenta);

    final greenListExpected = _transformListToColor(LogColor.green);
    final blackListExpected = _transformListToColor(LogColor.black);
    final whiteListExpected = _transformListToColor(LogColor.white);
    final redListExpected = _transformListToColor(LogColor.red);
    final yellowListExpected = _transformListToColor(LogColor.yellow);
    final blueListExpected = _transformListToColor(LogColor.blue);
    final cyanListExpected = _transformListToColor(LogColor.cyan);
    final magentaListExpected = _transformListToColor(LogColor.magenta);

    expect(greenListExpected, greenList);
    expect(blackListExpected, blackList);
    expect(whiteListExpected, whiteList);
    expect(redListExpected, redList);
    expect(yellowListExpected, yellowList);
    expect(blueListExpected, blueList);
    expect(cyanListExpected, cyanList);
    expect(magentaListExpected, magentaList);
  });
}

List<String> _transformListToColor(LogColor color) => _fakeList
    .map((e) => color.anciCode + e + LogColor.resetColor.anciCode)
    .toList();

final List<String> _fakeList = [
  'This text',
  'needs to change it\'s color',
  'by adding console string color',
  'in the start and the reset color',
  'in the final of the string',
];
