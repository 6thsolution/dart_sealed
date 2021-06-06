import 'dart:io';

final start = 'SF:';
final end = RegExp(
  '(super_enum_|)sealed_(annotations|example|generators|writer)',
);

void main() async {
  print('FIXCOV reading ...');
  final file = File('coverage/lcov.info');
  final lines = await file.readAsLines();

  print('FIXCOV fixing ...');
  var s = lines.firstWhere((e) => e.startsWith(start) && end.hasMatch(e));
  s = s.substring(start.length);
  s = s.substring(0, s.indexOf(end));
  print('FIXCOV extra: $s');
  if (s.isEmpty) {
    print('FIXCOV empty replace, done');
    return;
  }
  final content = lines.map((e) => e.replaceAll(s, '')).join('\n');

  print('FIXCOV writing ...');
  await file.writeAsString(content);

  print('FIXCOV done');
}
