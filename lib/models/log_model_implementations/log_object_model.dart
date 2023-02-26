part of 'package:sandbox_logger/sandbox_logger.dart';

class LogObjectModel extends LogModel {
  /// A optional title that will be on top of your [object].
  final String? title;

  /// A object will be printed with it's `toString()`
  final Object object;

  /// A enum that represents the type of border of your log template
  @override
  final LogBorderType borderType;

  /// The color of the text printed in the log. The [title], [object] and borders.
  @override
  final LogColor? color;

  const LogObjectModel(
    this.object, {
    this.title,
    this.borderType = LogBorderType.single,
    this.color,
  });

  const LogObjectModel.single(
    this.object, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.single;

  const LogObjectModel.header(
    this.object, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.header;

  const LogObjectModel.middle(
    this.object, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.middle;

  const LogObjectModel.bottom(
    this.object, {
    this.title,
    this.color,
  }) : borderType = LogBorderType.bottom;

  @override
  String toString() {
    return 'LogMapModel(title: $title, map: $object, borderType: $borderType, color: $color)';
  }

  @override
  LogObjectModel copyWith({
    String? title,
    Object? map,
    LogBorderType? borderType,
    LogColor? color,
  }) {
    return LogObjectModel(
      map ?? object,
      title: title ?? this.title,
      borderType: borderType ?? this.borderType,
      color: color ?? this.color,
    );
  }
}
