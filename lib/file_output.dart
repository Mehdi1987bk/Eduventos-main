import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

final df = DateFormat('d MMMM y, HH:mm:ss');

Future<File> createLogFile() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  File file = File('$appDocPath/logs.txt');
  return await file.create();
}

class FileOutput {
  FileOutput(this.file);

  final File file;

  Future<void> write(String line) async {
    await file.writeAsString("${df.format(DateTime.now())}  ${line.toString()}\n",
        mode: FileMode.writeOnlyAppend);
  }
}
