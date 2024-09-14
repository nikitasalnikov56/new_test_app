import 'package:app/app.dart';
import 'package:app/domain/database/notes_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NotesDataAdapter());
  // await Hive.deleteBoxFromDisk('data');
  await Hive.openBox<NotesData>('data');
  runApp(const App());
}
