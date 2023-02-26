part of 'package:sandbox_logger/sandbox_logger.dart';

class LogBorderSytle {
  final String topRightBorder;
  final String topLeftBorder;
  final String middleLeftBorder;
  final String middleRightBorder;
  final String connectorLeftBorder;
  final String connectorRightBorder;
  final String bottomRightBorder;
  final String bottomLeftBorder;
  final String traceBorder;

  const LogBorderSytle({
    required this.topRightBorder,
    required this.topLeftBorder,
    required this.traceBorder,
    required this.middleRightBorder,
    required this.middleLeftBorder,
    required this.connectorLeftBorder,
    required this.connectorRightBorder,
    required this.bottomRightBorder,
    required this.bottomLeftBorder,
  });

  const LogBorderSytle.singleBorder({
    this.topRightBorder = '┓',
    this.topLeftBorder = '┏',
    this.traceBorder = '─',
    this.middleRightBorder = '┃',
    this.middleLeftBorder = '┃',
    this.connectorLeftBorder = '┣',
    this.connectorRightBorder = '┫',
    this.bottomRightBorder = '┛',
    this.bottomLeftBorder = '┗',
  });

  const LogBorderSytle.doubleBorder({
    this.topRightBorder = '╗',
    this.topLeftBorder = '╔',
    this.traceBorder = '═',
    this.middleRightBorder = '║',
    this.middleLeftBorder = '║',
    this.connectorLeftBorder = '╠',
    this.connectorRightBorder = '╣',
    this.bottomRightBorder = '╝',
    this.bottomLeftBorder = '╚',
  });
}
