import 'package:app/domain/database/notes_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveBox{
  static final Box<NotesData> notes = Hive.box<NotesData>('data');
}