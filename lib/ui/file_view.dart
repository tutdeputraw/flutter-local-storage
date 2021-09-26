part of 'ui.dart';

class FileView extends StatefulWidget {
  final FileStorage storage = FileStorage();

  @override
  _FileViewState createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  int _counter = 0;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }

  Future delete() async {
    if (await widget.storage.delete()) {
      setState(() {
        _counter = 0;
      });
      showSnackBar('delete success');
    } else {
      showSnackBar('delete failed');
    }
  }

  Future read() async {
    final x = await widget.storage.readCounter();
    setState(() {
      _counter = x;
    });
  }

  Future rename() async {
    if (await widget.storage.changeFileNameOnly(_controller.text)) {
      showSnackBar('rename success');
    } else {
      showSnackBar('rename failed');
    }
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Management'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Baca File'),
          Text('Button tapped $_counter time${_counter == 1 ? '' : 's'}.'),
          ElevatedButton(
            child: const Text('delete'),
            onPressed: delete,
          ),
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'New File Name',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            child: const Text('rename file'),
            onPressed: rename,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
