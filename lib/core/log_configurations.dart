part of 'package:sandbox_logger/sandbox_logger.dart';

class LogConfigurations {
  final int defaultMaxHorizontalLenght;
  final LogBorderSytle defaultBorderStyle;
  final LogColor defaultColor;
  final LogColor defaultErrorColor;
  final bool isLogActivated;

  const LogConfigurations({
    this.defaultMaxHorizontalLenght = 80,
    this.defaultBorderStyle = const LogBorderSytle.doubleBorder(),
    this.defaultColor = LogColor.cyan,
    this.defaultErrorColor = LogColor.magenta,
    this.isLogActivated = true,
  });
}
