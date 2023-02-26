part of 'package:sandbox_logger/sandbox_logger.dart';

mixin UsecaseSplitBiggerLinesToSmallerLines {
  List<String> splitBiggerLinesToSmallerLines({
    required List<String> lines,
    required int maxHorizontalLenght,
  }) {
    final List<String> correctList = [];

    for (var splitedLines in lines.map((e) => e.split('\n'))) {
      for (var line in splitedLines) {
        // If contains (file:, it is a link of stacktrace
        // So in this case, we cant split that line in smaller lines
        if (line.contains('(file:')) {
          correctList.add(line);
        } else {
          correctList.addAll(splitBigStringInListOfSmallerStrings(
              text: line, maxHorizontalLenght: maxHorizontalLenght));
        }
      }
    }

    return correctList
        .map((line) => _pad + line.padRight(maxHorizontalLenght) + _pad)
        .toList();
  }

  List<String> splitBigStringInListOfSmallerStrings({
    required String text,
    required int maxHorizontalLenght,
  }) {
    List<String> result = [];
    while (text.length > maxHorizontalLenght) {
      int spaceIndex = text.lastIndexOf(' ', maxHorizontalLenght);
      if (spaceIndex == -1) {
        spaceIndex = maxHorizontalLenght;
      }
      result.add(text.substring(0, spaceIndex));
      text = text.substring(spaceIndex).trim();
    }
    result.add(text);
    return result;
  }
}
