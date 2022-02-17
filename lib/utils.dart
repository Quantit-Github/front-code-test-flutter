import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String? hexString) {
    if (hexString != null) {
      return Color(colorBuffer(hexString));
    } else {
      return Colors.white;
    }
  }

  static int colorBuffer(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return int.parse(buffer.toString(), radix: 16);
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  Color toConst() => this;
}

extension TimeParser on double? {
  DateTime get fromMillisec {
    if (this == null) {
      return DateTime.now();
    } else {
      return _fromMillisec;
    }
  }

  DateTime? get fromMillisecNull {
    if (this == null) {
      return null;
    } else {
      return _fromMillisec;
    }
  }

  DateTime get _fromMillisec {
    try {
      return DateTime.fromMillisecondsSinceEpoch(this!.toInt());
    } catch (e) {
      return DateTime.now();
    }
  }
}

extension EnumParser on String? {
  T toEnum<T extends Enum>({required List<T> values, required T error}) {
    if (this == null) {
      return error;
    } else {
      return values.firstWhere(
        (e) =>
            e.toString().toLowerCase().split(".").last == '$this'.toLowerCase(),
        orElse: () => error,
      );
    }
  }
}
