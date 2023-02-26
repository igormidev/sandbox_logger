import 'package:test/test.dart';
import 'package:sandbox_logger/sandbox_logger.dart';

class _TestModel with UsecaseSplitBiggerLinesToSmallerLines {}

void main() {
  final _TestModel usecase = _TestModel();

  final veryBigText1 =
      'This is a very big giant text but like a realy realy big text. Yes, think in a big text, i is this text. Soooooo big, realy big like giaaant (biggest possible).';

  final veryBigText2 =
      'This is a another big text. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  final expectedResponseVBT1 = [
    '  This is a very big giant text but like a realy realy big text. Yes, think in a    ',
    '  big text, i is this text. Soooooo big, realy big like giaaant (biggest            ',
    '  possible).                                                                        ',
  ];
  final expectedResponseVBT2 = [
    '  This is a another big text. Lorem ipsum dolor sit amet, consectetur adipisicing   ',
    '  elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim  ',
    '  ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  ',
    '  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit      ',
    '  esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat    ',
    '  non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.      ',
    '  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor   ',
    '  incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis        ',
    '  nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.     ',
    '  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu   ',
    '  fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in    ',
    '  culpa qui officia deserunt mollit anim id est laborum.                            ',
  ];

  test('Should split a big text in a list of smaller texts', () {
    final response = usecase.splitBigStringInListOfSmallerStrings(
      text: veryBigText1,
      maxHorizontalLenght: 80,
    );

    expect(response, expectedResponseVBT1.map((e) => e.trim()).toList());
  });

  test('Should split list with big strings as expected', () {
    final response = usecase.splitBiggerLinesToSmallerLines(
      lines: [veryBigText1, veryBigText2],
      maxHorizontalLenght: 80,
    );

    expect(response, [
      ...expectedResponseVBT1,
      ...expectedResponseVBT2,
    ]);
  });

  test(
      'Should split list with big strings into a list of smaller string and should not substring the file path line',
      () {
    final textPathFileIndicator =
        '(file:///home/igor/sandbox_logger/test/usecases/usecase_format_stack_trace_to_lines_test.dart:13:14)';
    final response = usecase.splitBiggerLinesToSmallerLines(
      lines: [
        veryBigText1,
        textPathFileIndicator,
        veryBigText2,
      ],
      maxHorizontalLenght: 80,
    );

    expect(response, [
      ...expectedResponseVBT1,
      '  $textPathFileIndicator  ', // Will only add padding, wihout spliting it
      ...expectedResponseVBT2,
    ]);
  });
}
