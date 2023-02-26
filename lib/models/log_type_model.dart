part of 'package:sandbox_logger/sandbox_logger.dart';

/// This is a abstract class. Use the classes [LogStringModel] for [String]
/// or [const LogMapModel] for logging a [Map] of a object, for exemple.
abstract class LogModel {
  const LogModel();
  abstract final LogColor? color;
  abstract final LogBorderType borderType;
  LogModel copyWith({LogColor color, LogBorderType borderType});

  /// {@macro type_of_logs}
  static LogSwitcherInterface get single =>
      LogSwitcherInterface(LogBorderType.single);

  /// {@macro type_of_logs}
  static LogSwitcherInterface get header =>
      LogSwitcherInterface(LogBorderType.header);

  /// {@macro type_of_logs}
  static LogSwitcherInterface get middle =>
      LogSwitcherInterface(LogBorderType.middle);

  /// {@macro type_of_logs}
  static LogSwitcherInterface get bottom =>
      LogSwitcherInterface(LogBorderType.bottom);
}

class LogSwitcherInterface {
  final LogBorderType borderType;
  LogSwitcherInterface(this.borderType);
}

extension LogSwitcherHelper on LogSwitcherInterface {
  LogExceptionModel exception({
    required Object error,
    required StackTrace stackTrace,
    LogColor? color,
  }) =>
      LogExceptionModel(
        error: error,
        stackTrace: stackTrace,
        color: color,
        borderType: borderType,
      );

  LogStringModel string(
    String text, {
    LogColor? color,
  }) =>
      LogStringModel(
        text,
        color: color,
        borderType: borderType,
      );

  LogMapModel map(
    Map<String, dynamic> map, {
    required String title,
    LogColor? color,
  }) =>
      LogMapModel(
        map,
        title: title,
        color: color,
        borderType: borderType,
      );
}
