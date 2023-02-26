part of 'package:sandbox_logger/sandbox_logger.dart';

class LogListMapModel extends LogModel {
  /// A optional title that will be on top of your [maps].
  final String? title;

  /// A List of maps to be printed in the console.
  /// To **print a object**, call his `toMap()` function.
  ///
  /// The model will be indented automatically when transformed to a string.
  final List<Map<dynamic, dynamic>> maps;

  /// A enum that represents the type of border of your log template
  @override
  final LogBorderType borderType;

  /// The color of the text printed in the log. The [title], [maps] and borders.
  @override
  final LogColor? color;

  const LogListMapModel(
    this.maps, {
    this.title,
    this.borderType = LogBorderType.single,
    this.color,
  });

  const LogListMapModel.single(
    this.maps, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.single;

  const LogListMapModel.header(
    this.maps, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.header;

  const LogListMapModel.middle(
    this.maps, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.middle;

  const LogListMapModel.bottom(
    this.maps, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.bottom;

  @override
  LogListMapModel copyWith({
    String? title,
    List<Map<String, dynamic>>? maps,
    LogBorderType? borderType,
    LogColor? color,
  }) {
    return LogListMapModel(
      maps ?? this.maps,
      title: title ?? this.title,
      borderType: borderType ?? this.borderType,
      color: color ?? this.color,
    );
  }
}
