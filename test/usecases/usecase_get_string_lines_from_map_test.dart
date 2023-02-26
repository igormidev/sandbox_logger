import 'package:sandbox_logger/sandbox_logger.dart';
import 'package:test/test.dart';

class _TestModel with UsecaseGetStringLinesFromMap {}

void main() {
  final _TestModel usecase = _TestModel();

  test(
    'Should print models and use tomap and toString of model case dosent have',
    () {
      final map = usecase.getStringLinesFromMap(testMapWithObjects);
      final resultModel = map.map((l) => '$l\n').join();
      expect(resultModel, fakeTestModelInMap);
    },
  );

  test('Should print list of maps', () {
    final resultModel = usecase
        .getStringLinesFromListOfMap([testMapWithObjects, testMap])
        .map((l) => '$l\n')
        .join();
    expect(resultModel, expectedListMapResult);
  });
}

final fakeModel = _FakeModel('Igor', 22);
final fakeModelWithToMap = _FakeModelWithToMap('Igor', 22);
final testMapWithObjects = {
  'objectWithToMap': fakeModelWithToMap,
  'object': fakeModel,
};
final Map<dynamic, dynamic> testMap = {
  "userName": "Igor",
  "age": 22,
  "totalCash": 138.57,
  "isMale": true,
  "userStatus": {
    "isUserActive": true,
    "isAPremiumUser": false,
  },
  "userTags": ["Flutter Developer", "Proactive", "Clean code"],
  "userCourses": [
    {
      "title": "How to use TDD in flutter",
      "finished": false,
      "coursePercentage": 47.4,
      "buyDate": "1969-07-20T20:18:04.000Z",
      "courseTag": ["New", "Popular"],
      "courseDetails": null,
    },
    {
      "title": "Clean arquiteture in flutter",
      "finished": false,
      "coursePercentage": 20.8,
      "buyDate": "1969-07-20T20:18:04.000Z",
      "courseTag": ["New"],
      "courseDetails": {
        "teacherName": "Tayler Mostoult",
        "totalSubscribers": 5402,
      },
    },
    {
      "title": "Micro-frontends in flutter",
      "finished": true,
      "coursePercentage": 100.0,
      "buyDate": "1969-07-20T20:18:04.000Z",
      "courseTag": [],
      "courseDetails": {
        "teacherName": "Ted Frisby",
        "totalSubscribers": 52,
      },
    }
  ]
};

class _FakeModel {
  final String name;
  final int age;
  const _FakeModel(this.name, this.age);

  @override
  String toString() => '_FakeModel(name: $name, age: $age)';
}

class _FakeModelWithToMap {
  final String name;
  final int age;
  const _FakeModelWithToMap(this.name, this.age);

  Map<String, dynamic> toMap() => {'name': name, 'age': age};
}

final fakeTestModelInMap = '''
{
  objectWithToMap: {
    name: "Igor",
    age: 22,
  },
  object: _FakeModel(name: Igor, age: 22)
},
''';

final fakeComplexMap = '''
{
  userName: "Igor",
  age: 22,
  totalCash: 138.57,
  isMale: true,
  userStatus: {
    isUserActive: true,
    isAPremiumUser: false,
  },
  userTags: [
    "Flutter Developer",
    "Proactive",
    "Clean code",
  ],
  userCourses: [
    {
      title: "How to use TDD in flutter",
      finished: false,
      coursePercentage: 47.4,
      buyDate: "1969-07-20T20:18:04.000Z",
      courseTag: [
        "New",
        "Popular",
      ],
      courseDetails: null,
    },
    {
      title: "Clean arquiteture in flutter",
      finished: false,
      coursePercentage: 20.8,
      buyDate: "1969-07-20T20:18:04.000Z",
      courseTag: [
        "New",
      ],
      courseDetails: {
        teacherName: "Tayler Mostoult",
        totalSubscribers: 5402,
      },
    },
    {
      title: "Micro-frontends in flutter",
      finished: true,
      coursePercentage: 100.0,
      buyDate: "1969-07-20T20:18:04.000Z",
      courseTag: [
      ],
      courseDetails: {
        teacherName: "Ted Frisby",
        totalSubscribers: 52,
      },
    },
  ],
},
''';

final expectedListMapResult = '''
[
  {
    objectWithToMap: {
      name: "Igor",
      age: 22,
    },
    object: _FakeModel(name: Igor, age: 22)
  },
  {
    userName: "Igor",
    age: 22,
    totalCash: 138.57,
    isMale: true,
    userStatus: {
      isUserActive: true,
      isAPremiumUser: false,
    },
    userTags: [
      "Flutter Developer",
      "Proactive",
      "Clean code",
    ],
    userCourses: [
      {
        title: "How to use TDD in flutter",
        finished: false,
        coursePercentage: 47.4,
        buyDate: "1969-07-20T20:18:04.000Z",
        courseTag: [
          "New",
          "Popular",
        ],
        courseDetails: null,
      },
      {
        title: "Clean arquiteture in flutter",
        finished: false,
        coursePercentage: 20.8,
        buyDate: "1969-07-20T20:18:04.000Z",
        courseTag: [
          "New",
        ],
        courseDetails: {
          teacherName: "Tayler Mostoult",
          totalSubscribers: 5402,
        },
      },
      {
        title: "Micro-frontends in flutter",
        finished: true,
        coursePercentage: 100.0,
        buyDate: "1969-07-20T20:18:04.000Z",
        courseTag: [
        ],
        courseDetails: {
          teacherName: "Ted Frisby",
          totalSubscribers: 52,
        },
      },
    ],
  },
]
''';
