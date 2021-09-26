part of 'business_logic.dart';

class FolderStorage {
  String folderName = "Bagus";

  Future<Directory> get _localPath async {
    Directory directory = Directory('/storage/emulated/0/Download');
    return directory;
  }

  Future<bool> deleteFolder() async {
    final Directory _appDocDir = await _localPath;
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/$folderName/');
    _appDocDirFolder.delete(recursive: true);
    return true;
  }

  Future<bool> renameFolder(String newName) async {
    final Directory _appDocDir = await _localPath;
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/$folderName/');

    _appDocDirFolder.rename('${_appDocDir.path}/$newName/');
    folderName = newName;
    return true;
  }

  Future<String> createFolderInAppDocDir() async {
    final Directory _appDocDir = await _localPath;
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/$folderName/');

    if (await _appDocDirFolder.exists()) {
      return _appDocDirFolder.path;
    } else {
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }
}
