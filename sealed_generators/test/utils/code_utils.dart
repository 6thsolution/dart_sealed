/// removes whitespace for better comparison
extension CodeUtils on String {
  static final regex = RegExp(r'\W+', multiLine: true);

  String tr() => replaceAll(regex, ' ').trim();
}
