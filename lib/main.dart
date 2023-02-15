import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mime/mime.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:read_file_mime/db.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: readFile(),
          builder: (context, snapshoot) {
            if (snapshoot.hasData) {
              return Center(
                child: Text(snapshoot.data.toString()),
              );
            }
            return const Center(
              child: Text('Loading ...'),
            );
          },
        ),
      ),
    );
  }

  Future<String> readFile() async {
    var content = await rootBundle.load('assets/file-example');
    final mime =
        lookupMimeType('temp', headerBytes: content.buffer.asUint8List());
    return 'MimeType = $mime';
  }
}
