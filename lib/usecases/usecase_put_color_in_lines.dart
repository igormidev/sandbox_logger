part of 'package:sandbox_logger/sandbox_logger.dart';

mixin UsecasePutColorInLines {
  List<String> putColorInEachLine({
    required List<String> lines,
    required LogColor color,
  }) {
    return lines.map((text) {
      return '${color.anciCode}$text${LogColor.resetColor.anciCode}';
    }).toList();
  }
}

/// Will print the [text] in `green` color to the console.
void logInGreen(Object text) => _logInAnyColor(text, LogColor.green.anciCode);

/// Will print the [text] in `black` color to the console.
void logInBlack(Object text) => _logInAnyColor(text, LogColor.black.anciCode);

/// Will print the [text] in `white` color to the console.
void logInWhite(Object text) => _logInAnyColor(text, LogColor.white.anciCode);

/// Will print the [text] in `red` color to the console.
void logInRed(Object text) => _logInAnyColor(text, LogColor.red.anciCode);

/// Will print the [text] in `yellow` color to the console.
void logInYellow(Object text) => _logInAnyColor(text, LogColor.yellow.anciCode);

/// Will print the [text] in `blue` color to the console.
void logInBlue(Object text) => _logInAnyColor(text, LogColor.blue.anciCode);

/// Will print the [text] in `cyan` color to the console.
void logInCyan(Object text) => _logInAnyColor(text, LogColor.cyan.anciCode);

/// Will print the [text] in `magenta` color to the console.
void logInMagenta(Object text) =>
    _logInAnyColor(text, LogColor.magenta.anciCode);

void _logInAnyColor(Object text, String colorAnci) =>
    print('$colorAnci$text${LogColor.resetColor.anciCode}');
