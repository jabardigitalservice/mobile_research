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
    final ext = getExtensionsFromType(mime);
    return 'MimeType = $mime \nExtension = $ext';
  }

  static String? getExtensionsFromType(String? type) {
    if (type == null || type.isEmpty) return null;

    if (database.containsKey(type)) {
      return database[type];
    }

    return null;
  }
}
