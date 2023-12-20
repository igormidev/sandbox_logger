import 'dart:async';
import 'dart:convert';
part 'core/constants.dart';
part 'core/enums.dart';
part 'core/extensions.dart';
part 'core/log_configurations.dart';
part 'models/log_type_model.dart';
part 'models/log_border_type.dart';
part 'models/log_model_implementations/log_exception_model.dart';
part 'models/log_model_implementations/log_map_model.dart';
part 'models/log_model_implementations/log_list_map_model.dart';
part 'models/log_model_implementations/log_string_model.dart';
part 'models/log_model_implementations/log_object_model.dart';
part 'models/log_model_implementations/log_list_object_model.dart';
part 'models/log_border_sytle.dart';
part 'usecases/usecase_put_color_in_lines.dart';
part 'usecases/usecase_format_stack_trace_to_lines.dart';
part 'usecases/usecase_get_string_lines_from_map.dart';
part 'usecases/usecase_wrap_sentences_with_border.dart';
part 'usecases/usecase_define_border_order_by_lenght.dart';
part 'usecases/usecase_split_bigger_lines_to_smaller_lines.dart';
part 'usecases/usecase_get_jsons_from_string.dart';
part 'usecases/usecase_transform_to_string_to_map.dart';
part 'sand_log_builder.dart';

test() {
  SandLog.setDefaultLogConfiguration(LogConfigurations(
    linesPrinterFunction: (List<String> lines) {
      print('''\n${lines.join('\n')}''');
    },
  ));
}
