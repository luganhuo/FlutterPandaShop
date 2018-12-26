import 'dart:io';

typedef FilterCallback = bool Function(String word);

List<String> scanDirectory(String base, FilterCallback filter) {
  List<String> result = List<String>();
  try {
    var dir = new Directory(base);
    List<FileSystemEntity> files = dir.listSync();

    for (final eachFile in files) {
      final curPath = eachFile.path;

      if (filter(curPath)) {
        result.add(curPath);
      }

      if (false == FileSystemEntity.isFileSync(curPath)) {
        result.addAll(scanDirectory(curPath, filter));
      }
    }
  } catch (e) {
    print('Error: $e');
  }

  return result;
}