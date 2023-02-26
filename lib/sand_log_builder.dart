part of 'package:sandbox_logger/sandbox_logger.dart';

class _UsecasesFacade
    with
        UsecaseFormatStackTraceToLines,
        UsecaseGetStringLinesFromMap,
        UsecasePutColorInLines,
        UsecaseWrapSentencesWithBorder,
        UsecaseDefineBorderOrderByLenght,
        UsecaseSplitBiggerLinesToSmallerLines,
        UsecaseGetJsonsFromString,
        UsecaseTransformToStringToMap {}

class SandLog {
  SandLog._();
  final _UsecasesFacade _usecase = _UsecasesFacade();

  factory SandLog.error(Object error, StackTrace stackTrace) {
    final instance = SandLog._();
    return instance.error(error, stackTrace);
  }
  SandLog error(Object error, StackTrace stackTrace) {
    if (_defaultConfiguration.isLogActivated == false) return this;
    _logsPipeline.add(LogExceptionModel(error: error, stackTrace: stackTrace));
    _resetDelay();
    return this;
  }

  factory SandLog.text(String? text) {
    final instance = SandLog._();
    return instance.text(text);
  }
  SandLog text(String? text) {
    if (_defaultConfiguration.isLogActivated == false) return this;
    _logsPipeline.add(LogStringModel(text ?? 'null'));
    _resetDelay();
    return this;
  }

  factory SandLog.map(Map? map, [String? title]) {
    final instance = SandLog._();
    return instance.map(map, null);
  }
  SandLog map(Map? map, [String? title]) {
    if (_defaultConfiguration.isLogActivated == false) return this;
    if (map == null) {
      _logsPipeline.add(LogStringModel('Log input was a null map value'));
    } else {
      _logsPipeline.add(LogMapModel(map, title: title));
    }
    _resetDelay();
    return this;
  }

  factory SandLog.listOfMap(List<Map> maps) {
    final instance = SandLog._();
    return instance.listOfMap(maps);
  }
  SandLog listOfMap(List<Map> maps, [String? title]) {
    if (_defaultConfiguration.isLogActivated == false) return this;
    _logsPipeline.add(LogListMapModel(maps, title: title));
    _resetDelay();
    return this;
  }

  factory SandLog.object(Object object, [String? title]) {
    final instance = SandLog._();
    return instance.object(object, title);
  }
  SandLog object(Object object, [String? title]) {
    if (_defaultConfiguration.isLogActivated == false) return this;
    _logsPipeline.add(LogObjectModel(object, title: title));
    _resetDelay();
    return this;
  }

  factory SandLog.listOfObject(List<Object> objects, [String? title]) {
    final instance = SandLog._();
    return instance.listOfObject(objects, title);
  }
  SandLog listOfObject(List<Object> objects, [String? title]) {
    if (_defaultConfiguration.isLogActivated == false) return this;
    _logsPipeline.add(LogListObjectModel(objects, title: title));
    _resetDelay();
    return this;
  }

  SandLog.logTemplate({
    required List<LogModel> logs,
  }) {
    if (_defaultConfiguration.isLogActivated == false) return;
    for (var log in logs) {
      final lines = _getLogLines(
        logModel: log,
        borderType: log.borderType,
        color: log.color ?? _defaultConfiguration.defaultColor,
      );
      print(lines.join('\n'));
    }
  }

  SandLog setColorTo(LogColor color) {
    _choosedColor = color;
    _resetDelay();
    return this;
  }

  SandLog setMaxLength(int horizontalLength) {
    _maxHorizontalLength = horizontalLength;
    _resetDelay();
    return this;
  }

  static void setDefaultLogConfiguration(LogConfigurations configurations) {
    _defaultConfiguration = configurations;
  }

  static LogConfigurations _defaultConfiguration = LogConfigurations();

  LogColor? _choosedColor;
  int? _maxHorizontalLength;
  final List<LogModel> _logsPipeline = [];

  Timer? _delay;
  void _resetDelay() {
    _delay?.cancel();
    _delay = Timer(Duration(milliseconds: 100), () {
      final isAllLogsError =
          _logsPipeline.length == 1 && _logsPipeline.first is LogExceptionModel;
      final didintChooseColor = _choosedColor == null;
      if (isAllLogsError && didintChooseColor) {
        _choosedColor = LogColor.magenta;
      }
      _log(_logsPipeline, _choosedColor ?? _defaultConfiguration.defaultColor);
    });
  }

  void _log(List<LogModel> logs, LogColor color) {
    final List<String> lines = [];
    final listOfBorder = _usecase.defineBorderOrderByLenght(logs.length);
    listOfBorder.forEachMapper((LogBorderType borderType, _, __, int index) {
      final logModel = logs[index];
      final List<String> linesWithColorAndBorder = _getLogLines(
          logModel: logModel, borderType: borderType, color: color);
      lines.addAll(linesWithColorAndBorder);
    });
    print(lines.join('\n'));
  }

  List<String> _getLogLines({
    required LogModel logModel,
    required LogBorderType borderType,
    required LogColor color,
  }) {
    final List<String> rawLines = [];

    switch (logModel.runtimeType) {
      case (LogStringModel):
        rawLines.addAll(
          _usecase.getGetJsonsFromString(
            rawText: (logModel as LogStringModel).text,
            getStringLinesFromMap: _usecase.getStringLinesFromMap,
          ),
        );
        break;

      case (LogMapModel):
        if ((logModel as LogMapModel).title != null) {
          rawLines.addAll(
            _usecase.getGetJsonsFromString(
              rawText: logModel.title ?? '',
              getStringLinesFromMap: _usecase.getStringLinesFromMap,
            ),
          );
        }

        rawLines.addAll(
          _usecase.getStringLinesFromMap(logModel.map),
        );
        break;

      case (LogListMapModel):
        if ((logModel as LogListMapModel).title != null) {
          rawLines.addAll(
            _usecase.getGetJsonsFromString(
              rawText: logModel.title ?? '',
              getStringLinesFromMap: _usecase.getStringLinesFromMap,
            ),
          );
        }
        rawLines.add('[');
        for (final Map map in logModel.maps) {
          rawLines.addAll(
            _usecase.getStringLinesFromMap(map).map((e) => _pad + e),
          );
        }
        rawLines.add(']');
        break;

      case (LogObjectModel):
        if ((logModel as LogObjectModel).title != null) {
          rawLines.addAll(
            _usecase.getGetJsonsFromString(
              rawText: logModel.title ?? '',
              getStringLinesFromMap: _usecase.getStringLinesFromMap,
            ),
          );
        }
        final lines = _usecase.replaceToStringModelToMapModels(
          rawText: logModel.object.toString(),
          getStringLinesFromMap: _usecase.getStringLinesFromMap,
          getGetJsonsFromString: _usecase.getGetJsonsFromString,
        );

        rawLines.addAll(lines);
        break;

      case (LogListObjectModel):
        if ((logModel as LogListObjectModel).title != null) {
          rawLines.addAll(
            _usecase.getGetJsonsFromString(
              rawText: logModel.title ?? '',
              getStringLinesFromMap: _usecase.getStringLinesFromMap,
            ),
          );
        }
        rawLines.add('[');
        for (final Object object in logModel.objects) {
          rawLines.addAll(
            _usecase
                .replaceToStringModelToMapModels(
                  rawText: object.toString(),
                  getStringLinesFromMap: _usecase.getStringLinesFromMap,
                  getGetJsonsFromString: _usecase.getGetJsonsFromString,
                )
                .map((e) => _pad + e),
          );
        }
        rawLines.add(']');
        break;

      case (LogExceptionModel):
        rawLines.add('${(logModel as LogExceptionModel).error}\n');
        final lines = _usecase.getFormatedStringLinesFromStackTrace(
            stackTrace: logModel.stackTrace);
        rawLines.addAll(lines);
        break;
    }

    final List<String> spacedLines = _usecase.splitBiggerLinesToSmallerLines(
      lines: rawLines,
      maxHorizontalLenght: _maxHorizontalLength ??
          _defaultConfiguration.defaultMaxHorizontalLenght,
    );

    final linesWithBorder = _usecase.wrapSentenceWithBorder(
      sentences: spacedLines,
      borderSytle: _defaultConfiguration.defaultBorderStyle,
      borderType: borderType,
      maxHorizontalLenght: _maxHorizontalLength ??
          _defaultConfiguration.defaultMaxHorizontalLenght,
    );

    final linesWithColorAndBorder = _usecase.putColorInEachLine(
      lines: linesWithBorder,
      color: color,
    );

    return linesWithColorAndBorder;
  }
}
