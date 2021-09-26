import 'package:flutter/material.dart';
import 'package:local_storage/ui/ui.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Reading and Writing Files',
      home: Homepage(),
    ),
  );
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reading and Writing Files')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Ketut Gede Bagus Putra Wirawan'),
            ElevatedButton(
              child: Text('File'),
              onPressed: () => Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => FileView(),
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Folder'),
              onPressed: () => Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => FolderView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}