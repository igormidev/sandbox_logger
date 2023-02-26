part of 'package:sandbox_logger/sandbox_logger.dart';

mixin UsecaseTransformToStringToMap {
  List<String> replaceToStringModelToMapModels({
    required String rawText,
    required List<String> Function(Map) getStringLinesFromMap,
    required List<String> Function({
      required List<String> Function(Map) getStringLinesFromMap,
      required String rawText,
    })
        getGetJsonsFromString,
  }) {
    final regex = RegExp(r'\w+\(');
    final castedString = rawText.replaceAllMapped(regex, (match) {
      return '{';
    }).replaceAll(')', '}');
    return getGetJsonsFromString(
      rawText: castedString,
      getStringLinesFromMap: getStringLinesFromMap,
    );
  }
}
