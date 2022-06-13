import 'package:sandbox_logger/sandbox_logger.dart';

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
    header: 'Request made successfully!',
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
    header: 'The document coming from the api is huge! '
        'Beware of large orders like this... A large file '
        'like this will spend a lot of the user\'s internet to download it.',
    text: ' [ Imagine here a huge value ]',
  );

  // Default log in white to check or see infos.
  SandLog.info(
    text: 'Is this variable correct? let\'s check',
    header: 'The value that came from the api is ${exempleModel.age}',
  );

  // Build your own template log with beginning, middle and end!
  //
  // The normal sequence is a [headler] first, then an indeterminate
  // number of [middle] and ending with [bottom].
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

class _ModelForExemple {
  final String name;
  final int age;
  final bool hasBugs;
  final double height;
  final Address address;
  _ModelForExemple({
    required this.name,
    required this.age,
    required this.hasBugs,
    required this.height,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'hasBugs': hasBugs,
      'height': height,
      'address': address.toMap(),
    };
  }

  @override
  String toString() =>
      '_ModelForExemple(name: $name, age: $age, hasBugs: $hasBugs, height: $height, address: $address)';
}

class Address {
  final String country;
  final String city;
  Address({required this.country, required this.city});

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'city': city,
    };
  }

  @override
  String toString() => 'Address(country: $country, city: $city)';
}
