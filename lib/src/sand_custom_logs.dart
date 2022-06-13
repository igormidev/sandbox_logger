import 'dart:convert';

part 'log_templates.dart';
part 'color_constants.dart';
part 'color_logs.dart';
part 'enums.dart';
part 'log_type_model.dart';
part 'extensions.dart';

class SandLog {
  /// A ready-made [text] log template for errors with default red
  /// [color] and ⛔ as the default [errorIcon] that has an optional
  /// [header] with the title of the error and the possibility to log a [object].
  static void error({
    String? text,
    Map<String, dynamic>? object,
    String header = 'An error has occurred !',
    LogColor color = LogColor.red,
    String errorIcon = '⛔',
  }) {
    _generateHeadlerLog(text, object, header, color, errorIcon);
  }

  static void info({
    String? text,
    Map<String, dynamic>? map,
    String header = 'Info:',
    LogColor color = LogColor.white,
    String infoIcon = '*️⃣',
  }) {
    _generateHeadlerLog(text, map, header, color, infoIcon);
  }

  static void warning({
    String? text,
    Map<String, dynamic>? map,
    String header = 'Warning! be alert with this:',
    LogColor color = LogColor.yellow,
    String warningIcon = '🔔',
  }) {
    _generateHeadlerLog(text, map, header, color, warningIcon);
  }

  static void success({
    String? text,
    Map<String, dynamic>? map,
    String header = 'Uhul! Success! No bugs.',
    LogColor color = LogColor.green,
    String warningIcon = '✅',
  }) {
    _generateHeadlerLog(text, map, header, color, '✅');
  }

  static void _generateHeadlerLog(
    String? message,
    Map<String, dynamic>? model,
    String header,
    LogColor color,
    String? icon,
  ) {
    if (message?.contains('\n') ?? false) {
      message = message?.replaceAll('\n', '');
    }
    if (model == null && message == null) {
      error(text: ' YOU ARE TRYING TO LOG WITHOUT PASSING A TEXT OR MAP');
      return;
    }
    final LogStringModel logHead =
        LogStringModel.headler(header, color: color, icon: icon);
    LogStringModel? text;
    LogMapModel? map;

    if (model != null) {
      if (message == null) {
        map = LogMapModel.bottom(model, color: color);
      } else {
        map = LogMapModel.middle(model, color: color);
      }
    }

    if (message != null) {
      text = LogStringModel.bottom(message, color: color);
    }
    List<LogModel> list = [
      logHead,
      if (map != null) map,
      if (text != null) text,
    ];
    logTemplateBuilder(list);
  }

  /// Use this method as tempalte to build your custom log
  /// with the combination of [LogModel]
  static void logTemplateBuilder(List<LogModel> logModels) {
    List<String> templates = [];

    // Here i will fill my list of strings [templates] that will me printed with
    // Strings that depend of the type of the abstract class [LogModel].
    for (LogModel model in logModels) {
      String? template;
      if (model is LogMapModel) {
        template = _buildMapTemplate(model, 80, model.borderType);
      }
      if (model is LogStringModel) {
        // Using 'ÇÇ' as a marker, could be any value that would hardly appear in a text
        //
        // This is made because i need some caracter to replace later for the icon, and
        // that place is the marker.
        String text = model.icon == null ? model.text : 'ÇÇ ' + model.text;
        template = _buildTemplate(text, 80, model.borderType)
            .replaceAll('ÇÇ', '${model.icon}');
      }
      if (template == null) return;
      templates
          .add(model.color.anciCode + template + LogColor.resetColor.anciCode);
    }

    print(templates.join(''));
  }
}
