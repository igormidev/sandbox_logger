part of 'package:sandbox_logger/sandbox_logger.dart';

mixin UsecaseGetStringLinesFromMap {
  final String prefix = '  ';

  List<String> getStringLinesFromListOfMap(List<Map> listOfMaps) {
    return listOfMaps
        .map((e) => getStringLinesFromMap(e))
        .expand((element) => element)
        .map((e) => '$prefix$e')
        .toList()
        .addInIndex(0, '[')
        .addInLast(']');
  }

  List<String> getStringLinesFromMap(Map map) {
    final mapLines = _getLinesFromMap(map);
    int prefixCounter = 0;

    mapLines.forEachMapper((line, isFirst, isLast, index) {
      if (line.trim().contains(']') || line.trim().contains('},')) {
        prefixCounter--;
      }
      final fullPrefix = prefix * prefixCounter;
      final String newValue = '$fullPrefix$line';
      mapLines[index] = newValue;

      if (line.trim().contains(': [') || line.trim().contains('{')) {
        prefixCounter++;
      }
    });

    return mapLines;
  }

  List<String> _getLinesFromMap(Map map) {
    final List<String> mapLines = [];

    mapLines.add('{');
    map.forEach((rawKey, rawValue) {
      final castedList = _normalizeDynamicValue(rawValue);
      castedList[0] = '$rawKey: ${castedList[0]}';
      mapLines.addAll(castedList);
    });
    mapLines.add('},');
    return mapLines;
  }

  List<String> _normalizeDynamicValue(dynamic rawValue) {
    final List<String> mapLines = [];
    final primitiveRunTypes = [
      String,
      bool,
      num,
      int,
      double,
      Null,
    ];

    if (primitiveRunTypes.contains(rawValue.runtimeType)) {
      if (rawValue is String) {
        final val = '"$rawValue",';
        mapLines.add(val); // Indicate its a String
      } else {
        mapLines.add('$rawValue,');
      }
    } else if (rawValue is Map) {
      mapLines.addAll(_getLinesFromMap(rawValue));
    } else if (rawValue is List) {
      final List<String> listLines = [];
      listLines.add('[');
      for (var listElement in rawValue) {
        listLines.addAll(_normalizeDynamicValue(listElement));
      }
      listLines.add('],');

      mapLines.addAll(listLines);
    } else {
      final recovery = _tryToTransformObjectInMap(rawValue);
      if (recovery != null) {
        mapLines.addAll(_getLinesFromMap(recovery));
      } else {
        mapLines.add(rawValue.toString());
      }
    }

    return mapLines;
  }

  /// If object has a `toMap()` method, it will try to use it
  /// If dosen't or a error occours, returns `null`
  Map? _tryToTransformObjectInMap(dynamic object) {
    try {
      return (object.toMap() as Map);
    } catch (_) {
      return null;
    }
  }
}
