import 'package:sandbox_logger/sandbox_logger.dart';

Future<void> main() async {
  final map1 = {'name': 'Igor', 'age': 22};
  final map2 = {'name': 'Daniel', 'age': 38};
  final StackTrace stackTrace = StackTrace.fromString(fakeStackText);

  SandLog.text('This is a header text')
      .error('FormatException: Invalid double', stackTrace)
      .map(testComplexMap)
      .listOfMap([map1, map2])
      .object(Person('Igor', 22, true))
      .listOfObject([Person('Igor', 22, true), Person('Daniel', 38, true)])
      .setColorTo(LogColor.green);

  logInBlack('Black text');
  logInBlue('Blue text');
  logInCyan('Cyan text');
  logInGreen('Green text');
  logInMagenta('Magenta text');
  logInRed('Red text');
  logInWhite('White text');
  logInYellow('Yellow text');

  final map = {'name': 'Igor', 'age': 22};
  SandLog.map(map);

  SandLog.listOfMap([map1, map2]);

  try {
    double.parse('text impossible to parse');
  } catch (error, stackTrace) {
    SandLog.error(error, stackTrace);
  }
  await Future.delayed(const Duration(seconds: 1));

  final person1 = Person('Igor', 22, true);
  final person2 = Person('Daniel', 38, true);

  SandLog.object(user); // Log 1 object

  SandLog.listOfObject([person1, person2]); // Log a list of object
}

class Person {
  final String name;
  final int age;
  final bool isAProgrammer;
  const Person(this.name, this.age, this.isAProgrammer);

  // Needs to have a toString like this:
  @override
  String toString() =>
      'Person(name: $name, age: $age, isAProgrammer: $isAProgrammer)';
}

final fakeStackText = '''
#0      double.parse (dart:core-patch/double_patch.dart:112:28)
#1      main.<anonymous closure> (file:///home/igor/sandbox_logger/test/usecases/usecase_format_stack_trace_to_lines_test.dart:13:14)
#2      Declarer.test.<anonymous closure>.<anonymous closure> (package:test_api/src/backend/declarer.dart:215:19)
<asynchronous suspension>
#3      Declarer.test.<anonymous closure> (package:test_api/src/backend/declarer.dart:213:7)
<asynchronous suspension>
#4      Invoker._waitForOutstandingCallbacks.<anonymous closure> (package:test_api/src/backend/invoker.dart:258:9)
<asynchronous suspension>
''';

final testComplexMap = {
  'userName': 'Igor',
  'age': 22,
  'totalCash': 138.57,
  'isMale:': true,
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

final user = User(
  userName: 'Igor Miranda Souza',
  age: 22,
  totalCash: 138.25,
  isMale: true,
  userStatus: UserStatus(isUserActive: true, isAPremiumUser: false),
  userTags: ['Flutter Developer', 'Proactive', 'Clean code'],
  userCourses: [
    UserCourse(
      title: 'How to use TDD in flutter',
      finished: false,
      coursePercentage: 47.2,
      buyDate: '1969-07-20T20:18:04.000Z',
      courseTag: ['New', 'Popular'],
      courseDetails: CourseDetails(
        teacherName: 'Tayler Mostoult',
        totalSubscribers: 5402,
      ),
    ),
    UserCourse(
      title: 'Clean arquiteture in flutter',
      finished: true,
      coursePercentage: 100.0,
      buyDate: '1969-07-20T20:18:04.000Z',
      courseTag: ['New'],
      courseDetails: CourseDetails(
        teacherName: 'Max Daniel',
        totalSubscribers: 5402,
      ),
    ),
  ],
);

class User {
  final String userName;
  final int age;
  final double totalCash;
  final bool isMale;
  final UserStatus userStatus;
  final List<String> userTags;
  final List<UserCourse> userCourses;
  const User({
    required this.userName,
    required this.age,
    required this.totalCash,
    required this.isMale,
    required this.userStatus,
    required this.userTags,
    required this.userCourses,
  });

  @override
  String toString() {
    return 'User(userName: $userName, age: $age, totalCash: $totalCash, isMale: $isMale, userStatus: $userStatus, userTags: $userTags, userCourses: $userCourses)';
  }
}

class UserStatus {
  final bool isUserActive;
  final bool isAPremiumUser;
  const UserStatus({
    required this.isUserActive,
    required this.isAPremiumUser,
  });

  @override
  String toString() =>
      'UserStatus(isUserActive: $isUserActive, isAPremiumUser: $isAPremiumUser)';
}

class UserCourse {
  final String title;
  final bool finished;
  final double coursePercentage;
  final String buyDate;
  final List<String> courseTag;
  final CourseDetails courseDetails;
  const UserCourse({
    required this.title,
    required this.finished,
    required this.coursePercentage,
    required this.buyDate,
    required this.courseTag,
    required this.courseDetails,
  });

  @override
  String toString() {
    return 'UserCourse(title: $title, finished: $finished, coursePercentage: $coursePercentage, buyDate: $buyDate, courseTag: $courseTag, courseDetails: $courseDetails)';
  }
}

class CourseDetails {
  final String teacherName;
  final int totalSubscribers;
  const CourseDetails({
    required this.teacherName,
    required this.totalSubscribers,
  });

  @override
  String toString() =>
      'CourseDetails(teacherName: $teacherName, totalSubscribers: $totalSubscribers)';
}

final testMap = {
  'userName': 'Igor',
  'age': 22,
  'totalCash': 138.57,
  'isMale:': true,
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
