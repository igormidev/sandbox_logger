part of 'package:sandbox_logger/sandbox_logger.dart';

class LogStringModel extends LogModel {
  /// The final text that will be printed
  final String text;

  /// A enum that represents the type of border of your log template
  @override
  final LogBorderType borderType;

  /// The [color] of the [text] and borders printed in the log
  @override
  final LogColor? color;

  LogStringModel(
    this.text, {
    this.borderType = LogBorderType.single,
    this.color,
  });

  LogStringModel.single(
    this.text, {
    this.color,
  }) : borderType = LogBorderType.single;

  LogStringModel.header(
    this.text, {
    this.color,
  }) : borderType = LogBorderType.header;

  LogStringModel.middle(
    this.text, {
    this.color,
  }) : borderType = LogBorderType.middle;

  const LogStringModel.bottom(
    this.text, {
    this.color,
  }) : borderType = LogBorderType.bottom;

  @override
  String toString() {
    return 'LogStringModel(text: $text, borderType: $borderType, color: $color)';
  }

  @override
  LogStringModel copyWith({
    String? text,
    String? icon,
    LogBorderType? borderType,
    LogColor? color,
  }) {
    return LogStringModel(
      text ?? this.text,
      borderType: borderType ?? this.borderType,
      color: color ?? this.color,
    );
  }
}
