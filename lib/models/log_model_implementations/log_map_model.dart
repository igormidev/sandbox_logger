part of 'package:sandbox_logger/sandbox_logger.dart';

class LogMapModel extends LogModel {
  /// A optional title that will be on top of your [map].
  final String? title;

  /// A map to be printed in the console.
  /// To **print a object**, call his `toMap()` function.
  ///
  /// The model will be indented automatically when transformed to a string.
  final Map<dynamic, dynamic> map;

  /// A enum that represents the type of border of your log template
  @override
  final LogBorderType borderType;

  /// The color of the text printed in the log. The [title], [map] and borders.
  @override
  final LogColor? color;

  const LogMapModel(
    this.map, {
    this.title,
    this.borderType = LogBorderType.single,
    this.color,
  });

  const LogMapModel.single(
    this.map, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.single;

  const LogMapModel.header(
    this.map, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.header;

  const LogMapModel.middle(
    this.map, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.middle;

  const LogMapModel.bottom(
    this.map, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.bottom;

  @override
  String toString() {
    return 'LogMapModel(title: $title, map: $map, borderType: $borderType, color: $color)';
  }

  @override
  LogMapModel copyWith({
    String? title,
    Map<String, dynamic>? map,
    LogBorderType? borderType,
    LogColor? color,
  }) {
    return LogMapModel(
      map ?? this.map,
      title: title ?? this.title,
      borderType: borderType ?? this.borderType,
      color: color ?? this.color,
    );
  }
}
