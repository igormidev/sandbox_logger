part of 'package:sandbox_logger/sandbox_logger.dart';

mixin UsecaseDefineBorderOrderByLenght {
  /// Will define the order of logs based on the quantity [lenght]
  ///
  /// In the return, will exist in the list the same amount of [LogBorderType]
  /// that [lenght] indicates.
  ///
  /// ## The return will be:
  /// - if [lenght] is 1, the return will be: <br>
  ///   [LogBorderType.single]<br>
  /// - if [lenght] is 2, the return will be: <br>
  ///   [LogBorderType.header] <br>
  ///   [LogBorderType.bottom] <br>
  /// - if [lenght] is 3 or more, everthing between the first and
  /// the last index will have [LogBorderType.middle].
  /// In a case with 4 [lenght], for exemple, we will have: <br>
  ///   [LogBorderType.header] <br>
  ///   [LogBorderType.middle] <br>
  ///   [LogBorderType.middle] <br>
  ///   [LogBorderType.bottom] <br>
  List<LogBorderType> defineBorderOrderByLenght(int lenght) {
    assert(lenght > 0, 'Needs to be bigger then zero');
    if (lenght == 1) return [LogBorderType.single];
    if (lenght == 2) return [LogBorderType.header, LogBorderType.bottom];

    return List.generate(lenght, (i) => i)
        .mapper((value, isFirst, isLast, index) {
      if (isFirst) return LogBorderType.header;
      if (isLast) return LogBorderType.bottom;
      return LogBorderType.middle;
    }).toList();
  }
}
