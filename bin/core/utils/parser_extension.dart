extension ParserExtension on String {
  toType(Type type) {
    switch (type) {
      case int:
        return int.parse(toString());
      default:
        return toString().trim();
    }
  }
}
