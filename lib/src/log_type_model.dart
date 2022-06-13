part of 'sand_custom_logs.dart';

/// This is a abstract class. Use the classes [LogStringModel] for [String]
/// or [LogMapModel] for logging a [Map] of a object, for exemple.
abstract class LogModel {
  abstract final LogColor color;
  abstract final LogBorderType borderType;
}

/// # Types of logs
/// The log tamplate has borders in top, right, left and bottom.
///
/// ### Use enums to separate information from a log.
/// The normal sequence is a [headler] first, then an indeterminate number of [middle] and ending with [bottom].
/// Using only [headler] and ending with [bottom] in the sequence is totaly okay to.
///
/// ### This is an overview of which borders each enum contains:
/// - [headler] will have `top, left` and `right` border and don't have a `bottom` border.
/// - [bottom] will have `bottom, left` and `right` border and don't have a `top` border.
/// - [middle] will have only `left` and `right` border and don't have a `top` or `bottom` border.
/// - [single] will have `all border` directions and is stand alone, it's not meant to be used together like the others.
enum LogBorderType { headler, middle, bottom, single }

class LogStringModel extends LogModel {
  /// The text that will be printed.
  final String text;

  /// A optional UTF-8 unicode icon.
  /// Exemple: '🔔'
  final String? icon;

  /// A enum that represents the type of border of your log template
  @override
  final LogBorderType borderType;

  /// The color of the [text] and borders printed in the log
  @override
  final LogColor color;

  LogStringModel(
    this.text, {
    this.borderType = LogBorderType.single,
    this.color = LogColor.cyan,
    this.icon,
  });

  LogStringModel.single(
    this.text, {
    this.color = LogColor.cyan,
    this.icon,
  }) : borderType = LogBorderType.single;

  LogStringModel.headler(
    this.text, {
    this.color = LogColor.cyan,
    this.icon,
  }) : borderType = LogBorderType.headler;

  LogStringModel.middle(
    this.text, {
    this.color = LogColor.cyan,
  })  : borderType = LogBorderType.middle,
        icon = null;

  LogStringModel.bottom(
    this.text, {
    this.color = LogColor.cyan,
    this.icon,
  }) : borderType = LogBorderType.bottom;

  @override
  String toString() {
    return 'LogStringModel(text: $text, icon: $icon, borderType: $borderType, color: $color)';
  }
}

class LogMapModel extends LogModel {
  /// A optional title that will be on top of your [map].
  final String? title;

  /// A map to be printed in the console.
  /// To **print a object**, call his `toMap()` function.
  ///
  /// The model will be indented automatically when transformed to a string.
  final Map<String, dynamic> map;

  /// A enum that represents the type of border of your log template
  @override
  final LogBorderType borderType;

  /// The color of the text printed in the log. The [title], [map] and borders.
  @override
  final LogColor color;

  LogMapModel(
    this.map, {
    this.title,
    this.borderType = LogBorderType.single,
    this.color = LogColor.cyan,
  });

  LogMapModel.single(
    this.map, {
    this.title,
    this.color = LogColor.cyan,
  }) : borderType = LogBorderType.single;

  LogMapModel.headler(
    this.map, {
    this.title,
    this.color = LogColor.cyan,
  }) : borderType = LogBorderType.headler;

  LogMapModel.middle(
    this.map, {
    this.title,
    this.color = LogColor.cyan,
  }) : borderType = LogBorderType.middle;

  LogMapModel.bottom(
    this.map, {
    this.title,
    this.color = LogColor.cyan,
  }) : borderType = LogBorderType.bottom;

  @override
  String toString() {
    return 'LogMapModel(title: $title, map: $map, borderType: $borderType, color: $color)';
  }
}
