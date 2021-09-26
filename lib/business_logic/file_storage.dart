part of 'business_logic.dart';

class FileStorage {
  late String fileName = 'latihan.txt';

  Future<String> get _localPath async {
    Directory directory = Directory('/storage/emulated/0/Download');
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('${path}/$fileName');
  }

  Future<bool> delete() async {
    final file = await _localFile;
    if (await isFileExist()) {
      file.delete();
      return true;
    }
    return false;
  }

  Future<bool> isFileExist() async {
    final file = await _localFile;
    if (await file.exists()) {
      return true;
    }
    return false;
  }

  Future<bool> changeFileNameOnly(String newFileName) async {
    final file = await _localFile;
    final path = await _localPath;
    if (await isFileExist()) {
      fileName = newFileName + '.txt';
      file.rename(path + '/' + fileName);
      return true;
    }
    return false;
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    return file.writeAsString('$counter');
  }
}