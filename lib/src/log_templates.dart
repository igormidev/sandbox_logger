part of 'sand_custom_logs.dart';

String _buildMapTemplate(
  LogMapModel model,
  int lenght,
  LogBorderType borderType,
) {
  String indexedText = const JsonEncoder.withIndent('  ').convert(model.map);
  List<String> words = [
    if (model.title != null) ..._obtainLinesOfText(model.title ?? '', lenght),
    ...indexedText.split('\n'),
  ];
  String linesWithBorder = _putBorderInLines(words, lenght);
  String template = _topAndBottomWrapper(linesWithBorder, lenght, borderType);
  return template;
}

String _buildTemplate(String rawText, int lenght, LogBorderType borderType) {
  final List<String> lines = _obtainLinesOfText(rawText, lenght);
  final String linesWithBorder = _putBorderInLines(lines, lenght);
  final String template =
      _topAndBottomWrapper(linesWithBorder, lenght, borderType);
  return template;
}

List<String> _obtainLinesOfText(String rawText, int lenght) {
  List<String> words = rawText.split(' ');
  return _formSentencesWithWords(words, lenght);
}

List<String> _formSentencesWithWords(
  List<String> words,
  int horizontalLenght,
) {
  List<String> sentences = [];
  String sentence = '';
  for (var word in words) {
    if (word.length >= horizontalLenght) {
      _manageBigWords(word, horizontalLenght);
      break;
    }
    if ((sentence.length + ' $word'.length) <= horizontalLenght) {
      sentence = sentence + ' $word';
    } else {
      sentences.add(sentence);
      sentence = '';
      sentence = sentence + ' $word';
    }
  }
  sentences.add(sentence);
  return sentences;
}

String _putBorderInLines(List<String> sentences, int horizontalLenght) {
  List<String> linesWithBorder = sentences.map((text) {
    String paddedText = text.padRight((horizontalLenght - 2), ' ');
    return '│ $paddedText │\n';
  }).toList();
  return linesWithBorder.join('');
}

String _topAndBottomWrapper(
  String text,
  int horizontalLenght,
  LogBorderType borderType,
) {
  final String traceRow = ''.padRight(horizontalLenght, '─');
  switch (borderType) {
    case LogBorderType.headler:
      return '''\n┌$traceRow┐\n$text├$traceRow┤''';
    case LogBorderType.middle:
      return '''\n$text├$traceRow┤''';
    case LogBorderType.bottom:
      return '''\n$text└$traceRow┘\n''';
    case LogBorderType.single:
      return '''\n┌$traceRow┐\n$text└$traceRow┘\n''';
  }
}

List<String> _manageBigWords(String word, int horizontalLenght) {
  final List<String> sentencesSplitedInWordsSmallerThanLimit = [];
  final List<String> sentences = word.splitByLength(horizontalLenght);
  for (var sentence in sentences) {
    if (sentencesSplitedInWordsSmallerThanLimit.length <= 30) {
      sentencesSplitedInWordsSmallerThanLimit.add(sentence);
    }
  }
  return [
    ...sentencesSplitedInWordsSmallerThanLimit,
    if (sentences.length > 30) 'HUGE TEXT! Sorry, had to be cropped :(',
  ];
}
