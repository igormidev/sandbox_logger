part of 'sand_custom_logs.dart';

enum LogColor {
  green,
  black,
  white,
  red,
  yellow,
  magenta,
  blue,
  cyan,
  resetColor,
}

extension LogExtensionColor on LogColor {
  String get anciCode {
    switch (this) {
      case LogColor.green:
        return _ansiGreenColor;
      case LogColor.black:
        return _ansiBlackColor;
      case LogColor.white:
        return _ansiWhiteColor;
      case LogColor.red:
        return _ansiRedColor;
      case LogColor.yellow:
        return _ansiYellowColor;
      case LogColor.blue:
        return _ansiBlueColor;
      case LogColor.cyan:
        return _ansiCyanColor;
      case LogColor.magenta:
        return _ansiMagentaColor;
      case LogColor.resetColor:
        return _ansiResetColor;
    }
  }
}
