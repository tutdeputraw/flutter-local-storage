part of 'ui.dart';

class FolderView extends StatefulWidget {
  final FolderStorage storage = FolderStorage();

  @override
  _FolderViewState createState() => _FolderViewState();
}

class _FolderViewState extends State<FolderView> {
  TextEditingController _controller = TextEditingController();

  Future _create() async {
    print('im here');
    final x = await widget.storage.makeFolder();
  }

  Future _delete() async {
    final x = await widget.storage.delete();
  }

  Future _rename() async {
    final x = await widget.storage.rename(_controller.text);
  }

  @override
  void initState() {
    widget.storage.makeFolder();
    super.initState();
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
              child: const Text('buat file'),
              onPressed: _create,
            ),
            ElevatedButton(
              child: const Text('hapus file'),
              onPressed: _delete,
            ),
            ElevatedButton(
              child: const Text('rename file'),
              onPressed: _rename,
            ),
          ],
        ),
      ),
    );
  }
}
