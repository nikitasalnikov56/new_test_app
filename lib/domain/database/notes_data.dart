import 'package:hive/hive.dart';

part 'notes_data.g.dart';

@HiveType(typeId: 0)
class NotesData {
  @HiveField(0)
  List<String>? image;
  @HiveField(1)
  String? cardText;
  @HiveField(2)
  double? stressValue;
  @HiveField(3)
  double? selfRatingValue;
  @HiveField(4)
  String? notes;
  @HiveField(5)
  String? itemsText;

  NotesData(
      {this.image,
      this.cardText,
      this.itemsText,
      this.stressValue,
      this.selfRatingValue,
      this.notes});
}
