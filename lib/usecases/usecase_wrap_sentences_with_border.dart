part of 'package:sandbox_logger/sandbox_logger.dart';

extension LogMapper on LogBorderType {
  T mapper<T>(T Function(LogBorderType) handler) => handler(this);
}

mixin UsecaseWrapSentencesWithBorder {
  /// Returns the same [sentences] list but wrapped
  /// with the border in the end and in the begining.
  List<String> wrapSentenceWithBorder({
    required List<String> sentences,
    required int maxHorizontalLenght,
    required LogBorderSytle borderSytle,
    LogBorderType borderType = LogBorderType.single,
  }) {
    final List<String> sentencesWithBorder = [];

    final String generateTraceRow = ''.padRight(
        maxHorizontalLenght + (_pad.length * 2), borderSytle.traceBorder);

    final String topRightBorder = borderSytle.topRightBorder;
    final String topLeftBorder = borderSytle.topLeftBorder;
    final String middleLeftBorder = borderSytle.middleLeftBorder;
    final String connectorLeftBorder = borderSytle.connectorLeftBorder;
    final String connectorRightBorder = borderSytle.connectorRightBorder;
    final String middleRightBorder = borderSytle.middleRightBorder;
    final String bottomRightBorder = borderSytle.bottomRightBorder;
    final String bottomLeftBorder = borderSytle.bottomLeftBorder;

    final top = '$topLeftBorder$generateTraceRow$topRightBorder';
    final middle = '$connectorLeftBorder$generateTraceRow$connectorRightBorder';
    final bottom = '$bottomLeftBorder$generateTraceRow$bottomRightBorder';

    switch (borderType) {
      case LogBorderType.header:
      case LogBorderType.single:
        sentencesWithBorder.add(top);
        break;
      case LogBorderType.bottom:
      case LogBorderType.middle:
        break;
    }

    for (var line in sentences) {
      sentencesWithBorder.add('$middleLeftBorder$line$middleRightBorder');
    }

    switch (borderType) {
      case LogBorderType.header:
      case LogBorderType.middle:
        sentencesWithBorder.add(middle);
        break;
      case LogBorderType.single:
      case LogBorderType.bottom:
        sentencesWithBorder.add(bottom);
        break;
    }

    return sentencesWithBorder;
  }
}
