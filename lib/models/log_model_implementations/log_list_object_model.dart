part of 'package:sandbox_logger/sandbox_logger.dart';

class LogListObjectModel extends LogModel {
  /// A optional title that will be on top of your [objects].
  final String? title;

  /// A List of maps to be printed in the console.
  /// To **print a object**, call his `toMap()` function.
  ///
  /// The model will be indented automatically when transformed to a string.
  final List<Object> objects;

  /// A enum that represents the type of border of your log template
  @override
  final LogBorderType borderType;

  /// The color of the text printed in the log. The [title], [objects] and borders.
  @override
  final LogColor? color;

  const LogListObjectModel(
    this.objects, {
    this.title,
    this.borderType = LogBorderType.single,
    this.color,
  });

  const LogListObjectModel.single(
    this.objects, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.single;

  const LogListObjectModel.header(
    this.objects, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.header;

  const LogListObjectModel.middle(
    this.objects, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.middle;

  const LogListObjectModel.bottom(
    this.objects, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.bottom;

  @override
  LogListObjectModel copyWith({
    String? title,
    List<Map<String, dynamic>>? maps,
    LogBorderType? borderType,
    LogColor? color,
  }) {
    return LogListObjectModel(
      maps ?? objects,
      title: title ?? this.title,
      borderType: borderType ?? this.borderType,
      color: color ?? this.color,
    );
  }
}
