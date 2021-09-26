part of 'business_logic.dart';

class FolderStorage {
  String folderName = "Bagus";

  Future<String> get getDirectoryPath async {
    Directory directory = Directory('/storage/emulated/0/Download');
    return directory.path;
  }

  Future<Directory> get _folder async {
    final path = await getDirectoryPath;
    return Directory('$path/$folderName');
  }

  Future<bool> delete() async {
    final folder = await _folder;
    if (await isDirectoryExist()) {
      folder.deleteSync(recursive: false);
      return true;
    }
    return false;
  }

  Future<bool> isDirectoryExist() async {
    final folder = await _folder;
    if (await folder.exists()) {
      return true;
    }
    return false;
  }

  Future<bool> rename(String newFolderName) async {
    final Directory = await _folder;
    final path = await getDirectoryPath;
    if (await isDirectoryExist()) {
      folderName = newFolderName;
      Directory.rename(path + '/' + folderName);
      return true;
    }
    return false;
  }

  Future<Directory> makeFolder() async {
    return await _folder;
  }
}
