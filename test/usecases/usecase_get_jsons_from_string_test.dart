import 'package:sandbox_logger/sandbox_logger.dart';
import 'package:test/test.dart';

class _TestModel with UsecaseGetJsonsFromString {}

void main() {
  final _TestModel usecase = _TestModel();
  final testMap = '{\'name\': \'Igor\', \'age\': 32}';

  test('Should obtain map as expected from text', () {
    final response = usecase.getGetJsonsFromString(
      rawText: testMap,
      getStringLinesFromMap: _fakeGetStringLinesFromSimpleMap,
    );
    expect(response, expectedList);
  });

  test('Shold get the json from the text and display it as expected', () async {
    final text = 'Ok, lets show this model $testMap '
        'so lets se if it will work';
    final response = usecase.getGetJsonsFromString(
      rawText: text,
      getStringLinesFromMap: _fakeGetStringLinesFromSimpleMap,
    );
    final expectedValue = [
      'Ok, lets show this model ',
      '{',
      '  name: "Igor",',
      '  age: 32,',
      '},',
      ' so lets se if it will work'
    ];
    expect(response, expectedValue);
  });
  test(
    'Shold get the list of json from the text and display it as expected',
    () {
      final text = 'Ok, lets show this list model [$testMap, $testMap] so lets '
          'se if it will work. With a normal $testMap. Lets see if all work';
      final response = usecase.getGetJsonsFromString(
        rawText: text,
        getStringLinesFromMap: _fakeGetStringLinesFromSimpleMap,
      );
      final expectedValue = [
        'Ok, lets show this list model ',
        '[',
        '  {',
        '    name: "Igor",',
        '    age: 32,',
        '  },',
        '  {',
        '    name: "Igor",',
        '    age: 32,',
        '  },',
        ']',
        ' so lets se if it will work. With a normal ',
        '{',
        '  name: "Igor",',
        '  age: 32,',
        '},',
        '. Lets see if all work',
      ];
      expect(response, expectedValue);
    },
  );
}

List<String> _fakeGetStringLinesFromSimpleMap(Map _) => expectedList;
final expectedList = ['{', '  name: "Igor",', '  age: 32,', '},'];

final testMapInStringFormat = testMap.toString();

final testMap = {
  'userName': 'Igor',
  'age': 22,
  'totalCash': 138.57,
  'isMale': true,
  'userStatus': {
    'isUserActive': true,
    'isAPremiumUser': false,
  },
  'userTags': ['Flutter Developer', 'Proactive', 'Clean code'],
  'userCourses': [
    {
      'title': 'How to use TDD in flutter',
      'finished': false,
      'coursePercentage': 47.4,
      'buyDate': '1969-07-20T20:18:04.000Z',
      'courseTag': ['New', 'Popular'],
      'courseDetails': null,
    },
    {
      'title': 'Clean arquiteture in flutter',
      'finished': false,
      'coursePercentage': 20.8,
      'buyDate': '1969-07-20T20:18:04.000Z',
      'courseTag': ['New'],
      'courseDetails': {
        'teacherName': 'Tayler Mostoult',
        'totalSubscribers': 5402,
      },
    },
    {
      'title': 'Micro-frontends in flutter',
      'finished': true,
      'coursePercentage': 100.0,
      'buyDate': '1969-07-20T20:18:04.000Z',
      'courseTag': [],
      'courseDetails': {},
    },
  ]
};
