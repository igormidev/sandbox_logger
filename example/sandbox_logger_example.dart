import 'dart:convert';
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
    header: 'The list coming from the api is huge!\n'
        'Beware of large orders like this...',
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

  _ModelForExemple copyWith({
    String? name,
    int? age,
    bool? hasBugs,
    double? height,
    Address? address,
  }) {
    return _ModelForExemple(
      name: name ?? this.name,
      age: age ?? this.age,
      hasBugs: hasBugs ?? this.hasBugs,
      height: height ?? this.height,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'hasBugs': hasBugs,
      'height': height,
      'address': address.toMap(),
    };
  }

  factory _ModelForExemple.fromMap(Map<String, dynamic> map) {
    return _ModelForExemple(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      hasBugs: map['hasBugs'] ?? false,
      height: map['height']?.toDouble() ?? 0.0,
      address: Address.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory _ModelForExemple.fromJson(String source) =>
      _ModelForExemple.fromMap(json.decode(source));

  @override
  String toString() {
    return '_ModelForExemple(name: $name, age: $age, hasBugs: $hasBugs, height: $height, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _ModelForExemple &&
        other.name == name &&
        other.age == age &&
        other.hasBugs == hasBugs &&
        other.height == height &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        age.hashCode ^
        hasBugs.hashCode ^
        height.hashCode ^
        address.hashCode;
  }
}

class Address {
  final String country;
  final String city;
  Address({
    required this.country,
    required this.city,
  });

  Address copyWith({
    String? country,
    String? city,
  }) {
    return Address(
      country: country ?? this.country,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'city': city,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      country: map['country'] ?? '',
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() => 'Address(country: $country, city: $city)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address && other.country == country && other.city == city;
  }

  @override
  int get hashCode => country.hashCode ^ city.hashCode;
}
