import 'package:sandbox_logger/sandbox_logger.dart';
import 'package:test/test.dart';

class _TestModel with UsecaseDefineBorderOrderByLenght {}

void main() {
  final _TestModel usecase = _TestModel();
  test('Should return a list with one item as a single border', () async {
    final response = usecase.defineBorderOrderByLenght(1);
    expect(response, hasLength(1));
    expect(response, [LogBorderType.single]);
  });

  test('Should return a list with two item as a header and bottom border',
      () async {
    final response = usecase.defineBorderOrderByLenght(2);
    expect(response, hasLength(2));
    expect(response, [LogBorderType.header, LogBorderType.bottom]);
  });

  test(
      'Should return a list with four item '
      'as a header, middle, middle bottom border', () async {
    final response = usecase.defineBorderOrderByLenght(4);
    expect(response, hasLength(4));
    expect(response, [
      LogBorderType.header,
      LogBorderType.middle,
      LogBorderType.middle,
      LogBorderType.bottom,
    ]);
  });
}
