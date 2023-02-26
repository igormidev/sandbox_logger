part of 'package:sandbox_logger/sandbox_logger.dart';

typedef Mapper<T, R> = R Function(
    T value, bool isFirst, bool isLast, int index);
typedef ForEachMapper<T> = void Function(
    T value, bool isFirst, bool isLast, int index);

extension ListUtils<T> on List<T> {
  List<R> mapper<R>(Mapper<T, R> toElement) {
    return asMap().entries.map((entry) {
      final index = entry.key;
      final value = entry.value;
      final isLast = (index + 1) == length;
      final isFirst = index == 0;
      return toElement(value, isFirst, isLast, index);
    }).toList();
  }

  void forEachMapper(ForEachMapper<T> toElement) {
    asMap().entries.forEach((entry) {
      final index = entry.key;
      final value = entry.value;
      final isLast = (index + 1) == length;
      final isFirst = index == 0;
      toElement(value, isFirst, isLast, index);
    });
  }

  List<T> addInIndex(int index, T newValue) {
    insert(index, newValue);
    return this;
  }

  List<T> addInLast(T newValue) {
    add(newValue);
    return this;
  }
}

extension ListStringExtension on List<String?> {
  List<String> get removeEmpty => removeNull
      .where((element) => element.isNotNull || element.isNotEmpty)
      .toList();

  List<String> get trim {
    if (length <= 0) return [];
    final first = this.first;
    final listWithoutFirst = this;
    listWithoutFirst.removeAt(0);
    return [
      if (first != null && first.isNotEmpty) first,
      ...listWithoutFirst.removeEmpty,
    ];
  }
}

extension NullableListLessBoilerPlateExtension<T> on List<T?> {
  bool get hasANotNullElement => any((element) => element != null);
  List<T> get removeNull => whereType<T>().toList();
}

extension ListLessBoilerPlateExtension<T> on List<T> {
  /// The single element satisfying [test].
  ///
  /// Returns `null` if there are either no elements
  /// or more than one element satisfying [test].
  ///
  /// **Notice**: This behavior differs from [Iterable.singleWhere]
  /// which always throws if there are more than one match,
  /// and only calls the `orElse` function on zero matches.
  T? singleWhereOrNull(bool Function(T element) test) {
    T? result;
    var found = false;
    for (var element in this) {
      if (test(element)) {
        if (!found) {
          result = element;
          found = true;
        } else {
          return null;
        }
      }
    }
    return result;
  }
}

extension ObjectLessBoilerPlateExtension on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension MatchExtension on Match {
  String get text => input.substring(start, end);
}

extension StringExtension on String {
  Map? get tryDecode {
    try {
      return jsonDecode(this);
    } catch (_) {
      return null;
    }
  }
}
