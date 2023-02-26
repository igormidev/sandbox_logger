# Sandbox Logger
A simple tool for beautiful and colorful console prints.

## Features
- Log in multiple colors
- Log texts
- Log Maps
- Log Error's/stacktrace.
- Log Objects
- Determine logs max horizontal lenght

## Getting started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  sandbox_logger: 
```

Import it:

```dart
import 'package:sandbox_logger/sandbox_logger.dart';
```

Use it:

```dart
// Call the log function
SandLog.text('Hello world');
```

# Concatenate log types and easily get a nice log at the end

## The models to be loged
```dart 
class Person {
  final String name; final int age; final bool isAProgrammer;
  const Person(this.name, this.age, this.isAProgrammer);

  // Needs to have a toString like this:
  @override
  String toString() => 'Person(name: $name, age: $age, isAProgrammer: $isAProgrammer)';
}
final map1 = {'name': 'Igor', 'age': 22};
final map2 = {'name': 'Daniel', 'age': 38};
final StackTrace stackTrace = StackTrace.fromString(fakeStackText);
```
## Using the log building types to build the final log
```dart 
// Building a log:
SandLog
    .text('This is a header text')
    .error('FormatException: Invalid double', stackTrace)
    .map( map1 )
    .listOfMap( [ map1 , map2 ] )
    .object( Person('Igor', 22, true) )
    .listOfObject( [ Person('Igor', 22, true) , Person('Daniel', 38, true) ] );
```

![](https://raw.githubusercontent.com/igormidev/sandbox_logger/main/art/full_exemple_log.png)

# Implementation of logs:

## Text log: 
```dart
SandLog.text('This is a test text\nLets see the result');
```

## Map log:
```dart
final map = {'name': 'Igor', 'age': 22};
SandLog.map(map);
```

## List of map log:
```dart
final map1 = {'name': 'Igor', 'age': 22};
final map2 = {'name': 'Daniel', 'age': 38};
SandLog.listOfMap([map1, map2]);
```

## Stacktrace logs:
```dart
try {
  double.parse('text impossible to parse');
} catch (error, stackTrace) {
  SandLog.error(error, stackTrace);
}
```

## Terminal output:

![](https://raw.githubusercontent.com/igormidev/sandbox_logger/main/art/exemple_log_text_map_error.png)


## Logging object and list of object:

A object that has a `.toString()` with this pattern:

```dart 
class Person {
  final String name;
  final int age;
  final bool isAProgrammer;
  const Person(this.name, this.age, this.isAProgrammer);

  // Needs to be a toString like this:
  @override
  String toString() => 'Person(name: $name, age: $age, isAProgrammer: $isAProgrammer)';
}
```

That pattern of the *"toString()"* above can be casted to a map that will be logged

```dart 
final person1 = Person('Igor', 22, true);
final person2 = Person('Daniel', 38, true);

SandLog.object(person1); // Log 1 object

SandLog.listOfObject([person1, person2]); // Log a list of object
```


## Terminal output:

![](https://raw.githubusercontent.com/igormidev/sandbox_logger/main/art/exemple_log_objects.png)

# Configurations

## Using configurations for a specific log:
This setting will only apply to this log. It is not a global/default setting as we will see below
```dart
SandLog
  .text('Test of color & max horizontal lenght setters')
  .setColorTo(LogColor.green) // Choose the desired color
  .setMaxLength(30); // Set the max horizontal lenght
```
![](https://raw.githubusercontent.com/igormidev/sandbox_logger/main/art/setters_exemple.png)

## Setting default configurations:
This configuration will be used in all the logs as default values.
Recomended to set this in the *main* function of the project
```dart
// This configuration will be valid to all logs
SandLog.setLogConfiguration(LogConfigurations(
  defaultMaxHorizontalLenght: 40,
  defaultColor: LogColor.yellow,
  defaultErrorColor: LogColor.magenta,
));
```
Another possible setting is to change the border style:
```dart
final LogBorderSytle myCustomBorderStyle = LogBorderSytle(
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

SandLog.setDefaultLogConfiguration(LogConfigurations(
  defaultBorderStyle: myCustomBorderStyle,
));
```
## Important! Configure when to make logs
The most important configuration is having a way to enable or disable the logs.
For exemple: in a release apk that final users will use, you don't want logs
to be printed.
```dart
SandLog.setDefaultLogConfiguration(LogConfigurations(
  // Will only print when running debug mode, nothing will be logged in release
  isLogActivated: kDebugMode, // Will only print is boolean is true, 
));
```

# Other functionalities
You can make a plain text log with any of the log colors
These logs `will not` have any type of formatting.

```dart
logInBlack('Black text');
logInBlue('Blue text');
logInCyan('Cyan text');
logInGreen('Green text');
logInMagenta('Magenta text');
logInRed('Red text');
logInWhite('White text');
logInYellow('Yellow text');
```

![](https://raw.githubusercontent.com/igormidev/sandbox_logger/main/art/log_in_exemple.png)

---

Made with ❤ by https://github.com/igormidev <br>
if you like the package, give a 👍
