part of 'sand_custom_logs.dart';

/// Will print the [text] in `green` color to the console.
void logInGreen(String? text) {
  print(LogColor.green.anciCode + '$text' + LogColor.resetColor.anciCode);
}

/// Will print the [text] in `black` color to the console.
void logInBlack(String? text) {
  print(LogColor.black.anciCode + '$text' + LogColor.resetColor.anciCode);
}

/// Will print the [text] in `white` color to the console.
void logInWhite(String? text) {
  print(LogColor.white.anciCode + '$text' + LogColor.resetColor.anciCode);
}

/// Will print the [text] in `red` color to the console.
void logInRed(String? text) {
  print(LogColor.red.anciCode + '$text' + LogColor.resetColor.anciCode);
}

/// Will print the [text] in `yellow` color to the console.
void logInYellow(String? text) {
  print(LogColor.yellow.anciCode + '$text' + LogColor.resetColor.anciCode);
}

/// Will print the [text] in `blue` color to the console.
void logInBlue(String? text) {
  print(LogColor.blue.anciCode + '$text' + LogColor.resetColor.anciCode);
}

/// Will print the [text] in `cyan` color to the console.
void logInCyan(String? text) {
  print(LogColor.cyan.anciCode + '$text' + LogColor.resetColor.anciCode);
}

/// Will print the [text] in `magenta` color to the console.
void logInMagenta(String text) {
  print(LogColor.magenta.anciCode + text + LogColor.resetColor.anciCode);
}
