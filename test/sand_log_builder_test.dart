// import 'dart:convert';

// import 'package:test/test.dart';

// import 'package:sandbox_logger/sandbox_logger.dart';

// import 'usecases/usecase_format_stack_trace_to_lines_test.dart';

// void main() {
//   // {name: Igor, age: 32, otherMap: {name: Daniel, age: 18}}, {name: Daniel, age: 18}
//   // {name: Igor, age: 32, otherMap: [{name: Daniel, age: 18}, {name: Daniel, age: 18}, {name: Daniel, age: 18}]}, {name: Daniel, age: 18}

//   test('sand log builder ...', () async {
//     final map1 = {'name': 'Igor', 'ag\ne': 32};
//     final map2 = {'name': 'Daniel', 'age': 18};

//     final List<Map> listOfMap = [map1, map2, testMap];
//     final encodedList = listOfMap.map((e) => jsonEncode(e)).toList().toString();
//     final decoded = jsonDecode(encodedList);
//     // SandLog.text('Ok, vamos lá$decoded');
//     SandLog //
//                 .error('Is not a valid type', StackTrace.fromString(stackText))
//             // .map({'name': 'Igor', 'age': 32}, 'This is the title')
//             // .text('Trying to log a text$testMap')
//             // .text('Trying to log a text$map1')
//             // .text('Trying to log a list of maps like this:$listOfMap')
//             // .text(
//             //     'Trying to log a lis\nt o${testMapInStringFormat}f maps $testMapInStringFormat $map1}')
//             // .text('Trying to $listOfMap a list of maps}')
//             // .setColorTo(LogColor.white)
//             // .text('AnotherText')

//             // .text(
//             //     'Ok, lets show this model\n{\'FELIPE\': \'Igor\', \'age\': 32}\n'
//             //     'And then lets [{"name": "PEDRO", "age": 32}, {"name": "Igor", "age": 32}] is this working?'
//             //     'And then lets [{\'name\': \'NATANAEL\', \'age\': 32}, {\'name\': \'Igor\', \'age\': 32}] is this working?'
//             //     //
//             //     )
//             .text('{\'FELIPE\': \'Igor\', \'age\': 32}'
//                 '{\'FELIPE\': \'Igor\', \'age\': 32} sadjkasdj'
//                 'askdjaskdj {\'FELIPE\': \'Igor\', \'age\': 32}'
//                 '[{"name": "PEDRO", "age": 32}, {"name": "Igor", "age": 32}] is this working?'
//                 'asdjask kjsad [{"name": "PEDRO", "age": 32}, {"name": "Igor", "age": 32}]'
//                 '[{\'name\': \'NATANAEL\', \'age\': 32}, {\'name\': \'Igor\', \'age\': 32}] is this working?'
//                 'And then lets [{\'name\': \'NATANAEL\', \'age\': 32}, {\'name\': \'Igor\', \'age\': 32}]'
//                 //
//                 )
//         // .text('$decoded')
//         // .listOfMap([
//         //   {'name': 'Igor', 'age': 32},
//         //   {'name': 'Igor', 'age': 32}
//         // ], 'This is the title')
//         ;
//     await Future.delayed(const Duration(seconds: 1));
//   });

//   test('Shold add the log in the log function', () async {
//     // final stackTrace = StackTrace.fromString(stackText);
//     // final sandLog = SandLog.error('Is not a valid type', stackTrace);
//     final person = Person('Igor', 22, true);
//     final user = User(
//       userName: 'Igor Miranda Souza',
//       age: 22,
//       totalCash: 138.25,
//       isMale: true,
//       userStatus: UserStatus(isUserActive: true, isAPremiumUser: false),
//       userTags: ['Flutter Developer', 'Proactive', 'Clean code'],
//       userCourses: [
//         UserCourse(
//           title: 'How to use TDD in flutter',
//           finished: false,
//           coursePercentage: 47.2,
//           buyDate: '1969-07-20T20:18:04.000Z',
//           courseTag: ['New', 'Popular'],
//           courseDetails: CourseDetails(
//             teacherName: 'Tayler Mostoult',
//             totalSubscribers: 5402,
//           ),
//         ),
//         UserCourse(
//           title: 'Clean arquiteture in flutter',
//           finished: true,
//           coursePercentage: 100.0,
//           buyDate: '1969-07-20T20:18:04.000Z',
//           courseTag: ['New'],
//           courseDetails: CourseDetails(
//             teacherName: 'Max Daniel',
//             totalSubscribers: 5402,
//           ),
//         ),
//       ],
//     );
//     // SandLog.text('Lets log a $user does it work?');
//     SandLog.text(
//       // 'Lets log a $testMap does it work?\nLets see this guy: $person',
//       'Lets print \nPica de mais hahahah $person',
//     ).object(person, 'Texto pica').object([user, person, user], 'Texto bom');
//     await Future.delayed(const Duration(seconds: 1));
//   });
// }

// final user = User(
//   userName: 'Igor Miranda Souza',
//   age: 22,
//   totalCash: 138.25,
//   isMale: true,
//   userStatus: UserStatus(isUserActive: true, isAPremiumUser: false),
//   userTags: ['Flutter Developer', 'Proactive', 'Clean code'],
//   userCourses: [
//     UserCourse(
//       title: 'How to use TDD in flutter',
//       finished: false,
//       coursePercentage: 47.2,
//       buyDate: '1969-07-20T20:18:04.000Z',
//       courseTag: ['New', 'Popular'],
//       courseDetails: CourseDetails(
//         teacherName: 'Tayler Mostoult',
//         totalSubscribers: 5402,
//       ),
//     ),
//     UserCourse(
//       title: 'Clean arquiteture in flutter',
//       finished: true,
//       coursePercentage: 100.0,
//       buyDate: '1969-07-20T20:18:04.000Z',
//       courseTag: ['New'],
//       courseDetails: CourseDetails(
//         teacherName: 'Max Daniel',
//         totalSubscribers: 5402,
//       ),
//     ),
//   ],
// );

// class User {
//   final String userName;
//   final int age;
//   final double totalCash;
//   final bool isMale;
//   final UserStatus userStatus;
//   final List<String> userTags;
//   final List<UserCourse> userCourses;
//   const User({
//     required this.userName,
//     required this.age,
//     required this.totalCash,
//     required this.isMale,
//     required this.userStatus,
//     required this.userTags,
//     required this.userCourses,
//   });

//   @override
//   String toString() {
//     return 'User(userName: $userName, age: $age, totalCash: $totalCash, isMale: $isMale, userStatus: $userStatus, userTags: $userTags, userCourses: $userCourses)';
//   }
// }

// class UserStatus {
//   final bool isUserActive;
//   final bool isAPremiumUser;
//   const UserStatus({
//     required this.isUserActive,
//     required this.isAPremiumUser,
//   });

//   @override
//   String toString() =>
//       'UserStatus(isUserActive: $isUserActive, isAPremiumUser: $isAPremiumUser)';
// }

// class UserCourse {
//   final String title;
//   final bool finished;
//   final double coursePercentage;
//   final String buyDate;
//   final List<String> courseTag;
//   final CourseDetails courseDetails;
//   const UserCourse({
//     required this.title,
//     required this.finished,
//     required this.coursePercentage,
//     required this.buyDate,
//     required this.courseTag,
//     required this.courseDetails,
//   });

//   @override
//   String toString() {
//     return 'UserCourse(title: $title, finished: $finished, coursePercentage: $coursePercentage, buyDate: $buyDate, courseTag: $courseTag, courseDetails: $courseDetails)';
//   }
// }

// class CourseDetails {
//   final String teacherName;
//   final int totalSubscribers;
//   const CourseDetails({
//     required this.teacherName,
//     required this.totalSubscribers,
//   });

//   @override
//   String toString() =>
//       'CourseDetails(teacherName: $teacherName, totalSubscribers: $totalSubscribers)';
// }

// final testMap = {
//   'userName': 'Igor',
//   'age': 22,
//   'totalCash': 138.57,
//   'isMale:': true,
//   'userStatus': {
//     'isUserActive': true,
//     'isAPremiumUser': false,
//   },
//   'userTags': ['Flutter Developer', 'Proactive', 'Clean code'],
//   'userCourses': [
//     {
//       'title': 'How to use TDD in flutter',
//       'finished': false,
//       'coursePercentage': 47.4,
//       'buyDate': '1969-07-20T20:18:04.000Z',
//       'courseTag': ['New', 'Popular'],
//       'courseDetails': null,
//     },
//     {
//       'title': 'Clean arquiteture in flutter',
//       'finished': false,
//       'coursePercentage': 20.8,
//       'buyDate': '1969-07-20T20:18:04.000Z',
//       'courseTag': ['New'],
//       'courseDetails': {
//         'teacherName': 'Tayler Mostoult',
//         'totalSubscribers': 5402,
//       },
//     },
//     {
//       'title': 'Micro-frontends in flutter',
//       'finished': true,
//       'coursePercentage': 100.0,
//       'buyDate': '1969-07-20T20:18:04.000Z',
//       'courseTag': [],
//       'courseDetails': {},
//     },
//   ]
// };
