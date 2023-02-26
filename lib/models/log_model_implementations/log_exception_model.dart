part of 'package:sandbox_logger/sandbox_logger.dart';

class LogExceptionModel extends LogModel {
  /// A enum that represents the type of border of your log template
  @override
  final LogBorderType borderType;

  /// The [color] of the text [error], [stackTrace] and borders printed in the log.
  @override
  final LogColor? color;

  /// The [Exception] error that will be logged with .toString().
  final Object error;

  /// The [StackTrace] that will be logged with the tracking of the error.
  final StackTrace stackTrace;

  LogExceptionModel({
    required this.error,
    required this.stackTrace,
    this.color,
    this.borderType = LogBorderType.single,
  });

  LogExceptionModel.single({
    required this.error,
    required this.stackTrace,
    this.color,
  }) : borderType = LogBorderType.single;

  LogExceptionModel.header({
    required this.error,
    required this.stackTrace,
    this.color,
  }) : borderType = LogBorderType.header;

  LogExceptionModel.middle({
    required this.error,
    required this.stackTrace,
    this.color,
  }) : borderType = LogBorderType.middle;

  LogExceptionModel.bottom({
    required this.error,
    required this.stackTrace,
    this.color,
  }) : borderType = LogBorderType.bottom;

  @override
  LogExceptionModel copyWith({
    LogBorderType? borderType,
    LogColor? color,
    Object? error,
    StackTrace? stackTrace,
  }) {
    return LogExceptionModel(
      borderType: borderType ?? this.borderType,
      color: color ?? this.color,
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }
}
