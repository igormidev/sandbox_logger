part of 'package:sandbox_logger/sandbox_logger.dart';

/// {@template type_of_logs}
/// # Types of logs
/// The log tamplate has borders in top, right, left and bottom.
///
/// ### Use enums to separate information from a log.
/// The normal sequence is a [header] first, then
/// an indeterminate number of [middle] and ending with [bottom].
///
/// Using only [header] and ending with [bottom] in the sequence is totaly okay to.
///
/// If you are using just a single log, use the [single].
///
/// ### This is an overview of which borders each enum contains:
/// - [header] will have `top, left` and `right` border and don't have a `bottom` border.
/// - [bottom] will have `bottom, left` and `right` border and don't have a `top` border.
/// - [middle] will have only `left` and `right` border and don't have a `top` or `bottom` border.
/// - [single] will have `all border` directions and is stand alone, it's not meant to be used together like the others.
/// {@endtemplate}

/// {@macro type_of_logs}
enum LogBorderType {
  /// {@macro type_of_logs}
  header,

  /// {@macro type_of_logs}
  middle,

  /// {@macro type_of_logs}
  bottom,

  /// {@macro type_of_logs}
  single;
}
