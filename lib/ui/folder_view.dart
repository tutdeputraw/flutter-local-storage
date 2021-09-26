part of 'ui.dart';

class FolderView extends StatefulWidget {
  final FolderStorage storage = FolderStorage();

  @override
  _FolderViewState createState() => _FolderViewState();
}

class _FolderViewState extends State<FolderView> {
  TextEditingController _controller = TextEditingController();

  Future _create() async {
    widget.storage.createFolderInAppDocDir();
    showSnackBar('success');
  }

  Future _delete() async {
    widget.storage.deleteFolder();
    showSnackBar('success');
  }

  Future _rename() async {
    await widget.storage.renameFolder(_controller.text);
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Folder Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: const Text('Create Folder'),
              onPressed: _create,
            ),
            ElevatedButton(
              child: const Text('Delete Folder'),
              onPressed: _delete,
            ),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'New Folder Name',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              child: const Text('rename Folder'),
              onPressed: _rename,
            ),
          ],
        ),
      ),
    );
  }
}
