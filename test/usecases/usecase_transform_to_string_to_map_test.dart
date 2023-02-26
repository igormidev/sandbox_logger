import 'package:sandbox_logger/sandbox_logger.dart';
import 'package:test/test.dart';

class _TestModel with UsecaseTransformToStringToMap {}

void main() {
  final _TestModel usecase = _TestModel();
  test('Shold transform a toString() object to a ', () {
    final response = usecase.replaceToStringModelToMapModels(
      rawText: user.toString(),
      getStringLinesFromMap: _getStringLinesFromMap,
      getGetJsonsFromString: getGetJsonsFromString,
    );
    expect(response.first, 'corrent');
  });
}

List<String> _getStringLinesFromMap(Map<dynamic, dynamic> map) => [];
List<String> getGetJsonsFromString({
  required List<String> Function(Map<dynamic, dynamic>) getStringLinesFromMap,
  required String rawText,
}) {
  if (rawText == testMap.toString()) return ['corrent'];

  return [];
}

final user = User(
  userName: 'Igor Miranda Souza',
  age: 22,
  totalCash: 138.57,
  isMale: true,
  userStatus: UserStatus(isUserActive: true, isAPremiumUser: false),
  userTags: ['Flutter Developer', 'Proactive', 'Clean code'],
  userCourses: [
    UserCourse(
      title: 'How to use TDD in flutter',
      finished: false,
      coursePercentage: 47.4,
      buyDate: '1969-07-20T20:18:04.000Z',
      courseTag: ['New', 'Popular'],
      courseDetails: null,
    ),
    UserCourse(
      title: 'Clean arquiteture in flutter',
      finished: false,
      coursePercentage: 20.8,
      buyDate: '1969-07-20T20:18:04.000Z',
      courseTag: ['New'],
      courseDetails: CourseDetails(
        teacherName: 'Tayler Mostoult',
        totalSubscribers: 5402,
      ),
    ),
    UserCourse(
      title: 'Micro-frontends in flutter',
      finished: true,
      coursePercentage: 100.0,
      buyDate: '1969-07-20T20:18:04.000Z',
      courseTag: [],
      courseDetails: CourseDetails(
        teacherName: 'Max Daniel',
        totalSubscribers: 38,
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
  final CourseDetails? courseDetails;
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
  'userName': 'Igor Miranda Souza',
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
      'courseDetails': {
        'teacherName': 'Max Daniel',
        'totalSubscribers': 38,
      },
    },
  ]
};
