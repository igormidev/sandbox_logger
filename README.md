# Sandbox Logger
A simple tool for more beautiful and colorful console prints.

## Features

Allows you to create custom log templates to be able to print everything that happens in your application! Likewise, it also allows quick prints just as beautifully!

## Getting started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  sandbox_logger: ^1.0.0
```

Import it:

```dart
import 'package:sandbox_logger/sandbox_logger.dart';
```


## Usage Exemples

### Exemple of a quick log of object:
*Colors, icons can be changed. The parameter headler, map and text are optional.*

```dart
void main() {
  // A model that will be used as exemple
  _ModelForExemple exempleModel = _ModelForExemple(
    name: 'Igor Miranda Souza',
    age: 21,
    hasBugs: true,
    height: 1.82,
    address: Address(
      city: 'Silicon Valley',
      country: 'California',
    ),
  );

  // Log in green when your methods have success!
  SandLog.success(
    header: 'Requisição feita com sucesso!',
    text: 'Status code: 200',
    map: exempleModel.toMap(),
  );

  // Log in red in your error handler when you got a error.
  // An error is bad, but an error without a nice log is worse.
  SandLog.error(
    header: 'An error occurred in my request!',
    text: 'ERRO 404! Invalid Route',
  );

  // Log in yellow a warning to be aware when something happends
  SandLog.warning(
    header: 'The list coming from the api is huge!\n'
        'Beware of large orders like this...',
    text: ' [ Imagine here a huge value ]',
  );

  // Default log in white to check or see infos.
  SandLog.info(
    text: 'Is this variable correct? let\'s check',
    header: 'The value that came from the api is ${exempleModel.age}',
  ); 
}
```

The console:

![](https://raw.githubusercontent.com/igormidev/sandbox_logger/main/images/simple_log_exemple.png)

---

### Example of a more complex, beautiful and `personalized` print:

```dart
void main() {
  // A model that will be used as exemple
  _ModelForExemple exempleModel = _ModelForExemple(
    name: 'Igor Miranda Souza',
    age: 21,
    hasBugs: true,
    height: 1.82,
    address: Address(
      city: 'Silicon Valley',
      country: 'California',
    ),
  );
  
  // Build your own template log with beginning, middle and end!
  //
  // The normal sequence is a [headler] first, then an indeterminate
  // number of [middle] and ending with [bottom].that
  //
  // Use [LogStringModel] to add a string and [LogMapModel] when you
  // want to add a object to the list of [LogModel] that will be printed.
  //
  // Using only [headler] and ending with [bottom] without [middle]
  // in the sequence is totaly okay to.
  SandLog.logTemplateBuilder(<LogModel>[
    LogStringModel.headler('This is a headler text'),
    LogStringModel.middle('This is a middle text'),
    LogMapModel.middle(exempleModel.toMap(), title: 'My Model:'),
    LogStringModel.bottom('This is a final bottom text'),
  ]);
}
```

The console:

![](https://raw.githubusercontent.com/igormidev/sandbox_logger/main/images/custom_log_exemple.png)

See the complete code in the `/example` folder. 



## Important!

Note: It is dangerous to leave prints of http requests appearing on the console in production. Try creating a flag to only make your prints when in develop mode.

