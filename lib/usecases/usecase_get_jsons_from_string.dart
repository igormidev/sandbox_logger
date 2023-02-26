part of 'package:sandbox_logger/sandbox_logger.dart';

mixin UsecaseGetJsonsFromString {
  List<String> getGetJsonsFromString({
    required String rawText,
    required List<String> Function(Map) getStringLinesFromMap,
  }) {
    final regex = RegExp(r'{|}');
    final matches = regex.allMatches(rawText);
    final List<int> openBracketsIndex = [];
    final List<int> closeBracketsIndex = [];
    for (final Match match in matches) {
      if (match.text == '{') openBracketsIndex.add(match.start);
      if (match.text == '}') closeBracketsIndex.add(match.start);
    }

    String newText = rawText;
    int lastIndexAdded = 0;

    for (final int openBracketIndex in openBracketsIndex) {
      for (final int closeBracketIndex in closeBracketsIndex) {
        if (openBracketIndex > closeBracketIndex) continue;
        if (openBracketIndex < lastIndexAdded) continue;
        final possibleMap =
            rawText.substring(openBracketIndex, closeBracketIndex + 1);
        final map = _tryCastMapFromString(possibleMap.replaceAll('\n', ''));

        if (map != null) {
          lastIndexAdded = closeBracketIndex;

          // Lets indentify if this map is inside a list, we will need to add a padding if it is
          final prevCaracterIndex = openBracketIndex - 1;
          final nextCaracterIndex = closeBracketIndex + 1;

          final hasOpenListBracketBefore =
              existsPatternIn(rawText, '[', prevCaracterIndex);
          final hasCloseListBracketAfter =
              existsPatternIn(rawText, ']', nextCaracterIndex);
          final hasMapPatternBefore = existsPatternIn(
              rawText, '}, ', prevCaracterIndex - 2, prevCaracterIndex + 1);
          final hasMapPatternAfter = existsPatternIn(
              rawText, ', {', nextCaracterIndex, nextCaracterIndex + 3);

          final validEnd = (hasCloseListBracketAfter || hasMapPatternAfter);
          if (hasOpenListBracketBefore && validEnd) {
            final formatedMap =
                getStringLinesFromMap(map).map((e) => _pad + e).join('\n');
            final closeListBracketSpace =
                hasCloseListBracketAfter ? '\n]\n' : '';
            newText = newText.replaceAll(
              '[$possibleMap${hasCloseListBracketAfter ? ']' : ''}',
              '\n[\n$formatedMap$closeListBracketSpace',
            );
            continue;
          }

          if (hasMapPatternBefore && validEnd) {
            final formatedMap =
                getStringLinesFromMap(map).map((e) => _pad + e).join('\n');
            final closeListBracketSpace =
                hasCloseListBracketAfter ? '\n]\n' : '';
            newText = newText.replaceAll(
              possibleMap + (hasCloseListBracketAfter ? ']' : ''),
              '\n$formatedMap$closeListBracketSpace',
            );
            continue;
          }

          newText = newText.replaceAll(
            possibleMap,
            '\n${getStringLinesFromMap(map).join('\n')}\n',
          );
        }
      }
    }
    final splitedText = newText.split('\n').map((e) {
      if (e.trimRight().endsWith(',,')) {
        final res = e.trimRight().substring(0, e.trimRight().length - 1);
        return res;
      }
      return e;
    }).toList();
    splitedText.removeWhere((element) => element.trim() == ',');
    if (splitedText.first == '') {
      splitedText.removeAt(0);
    }
    if (splitedText.length > 1 && splitedText.last == '') {
      splitedText.removeLast();
    }

    return splitedText;
  }

  Map<String, dynamic>? _tryCastMapFromString(String rawText) {
    try {
      return _getJsonFromString(rawText);
    } catch (_) {
      return null;
    }
  }

  bool existsPatternIn(
    final String rawString,
    final String pattern,
    final int start, [
    final int? end,
  ]) {
    try {
      final String text;
      if (end != null) {
        text = rawString.substring(start, end);
      } else {
        text = rawString[start];
      }
      return text == pattern;
    } catch (_) {
      return false;
    }
  }

  Map<String, dynamic> _getJsonFromString(String rawText) {
    // Will find, for exemple, the text: "{isUserActive:"
    final regexMapKeyWithOpenBracket = RegExp('(?<={)(.*?):+');
    // Will find, for exemple, the text: ", userCourses:"
    final regexMapKeyWithCommaAndSpace = RegExp(r'(?<=, )([^\]]*?):');

    final regexOnlyKeyInLine = RegExp(r'^.+:$');

    final splitedSentences = rawText
        .replaceAllMapped(regexMapKeyWithCommaAndSpace,
            (Match match) => '\n${match.text.trim()}\n')
        .replaceAllMapped(regexMapKeyWithOpenBracket,
            (Match match) => '\n${match.text.trim()}\n')
        .replaceAll(RegExp(r'}(?=,|]|}|$|\s+)'), '\n}\n')
        .replaceAll(RegExp(r'(?<=(,|:|^|\[)\s?){'), '\n{\n')
        .replaceAll(RegExp('\\[\\s?\\]'), '\n[\n]\n')
        .replaceAll(RegExp('\\{\\s?\\}'), '\n{\n}\n')
        .replaceAll('[', '\n[\n')
        .replaceAll(']', '\n]\n')
        .replaceAll(',', '\n,\n')
        .split('\n')
      ..removeWhere((element) => element.replaceAll(' ', '').isEmpty);

    final List<String> correctLines = [];
    for (String line in splitedSentences) {
      final isMapKey = regexOnlyKeyInLine.hasMatch(line);

      if (isMapKey) {
        final lineWithoutFinalTwoDots = line.substring(0, line.length - 1);
        final lineWithQuaot = _putQuotationMarks(lineWithoutFinalTwoDots);

        correctLines.add('$lineWithQuaot:');
      } else {
        String l = line.trim();

        final hasCommaInFinal = l.endsWith(',') && l.length > 1;
        if (hasCommaInFinal) l = l.substring(0, l.length - 1);

        // If it falls in this else, it is a value of a key or a map structure
        final isNumber = double.tryParse(l) != null || int.tryParse(l) != null;
        final isBolean = l == 'false' || l == 'true';
        final isStructureCaracter =
            ['{', '}', '[', ']', ','].any((e) => e == l);
        final isNull = l == 'null';
        if (isStructureCaracter || isNumber || isBolean || isNull) {
          if (hasCommaInFinal) {
            correctLines.add('$l,');
          } else {
            correctLines.add(l);
          }
          continue;
        }

        // If you got to this point, i'm sure it's a value string, so lets add a double quote
        final lineWithQuaot = _putQuotationMarks(l);
        if (hasCommaInFinal) {
          correctLines.add('$lineWithQuaot,');
        } else {
          correctLines.add(lineWithQuaot);
        }
      }
    }

    final Map<String, dynamic> decoded = {};
    (jsonDecode(correctLines.join('')) as Map)
        .cast<String, dynamic>()
        .forEach((key, value) {
      decoded[key] = value;
    });

    return decoded;
  }

  String _putQuotationMarks(String findedText) {
    findedText = findedText.trim().replaceAll(RegExp('^\'|\'\$'), '"');

    if (!findedText.startsWith('\'') && !findedText.startsWith('"')) {
      findedText = '"${findedText[0]}${findedText.substring(1)}';
    }
    if (!findedText.endsWith('\'') && !findedText.endsWith('"')) {
      final lastIndex = findedText.length - 1;
      findedText =
          '${findedText.substring(0, lastIndex)}${findedText[lastIndex]}"';
    }

    final texto = findedText;
    return texto;
  }
}
