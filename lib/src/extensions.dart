part of 'sand_custom_logs.dart';

extension StringExtension on String {
  List<String> splitByLength(int length) {
    List<String> pieces = [];

    for (int i = 0; i < this.length; i += length) {
      int offset = i + length;
      pieces.add(substring(i, offset >= this.length ? this.length : offset));
    }
    return pieces;
  }
}
