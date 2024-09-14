part of 'data_base_save_bloc.dart';

sealed class DataBaseSaveEvent extends Equatable {
  const DataBaseSaveEvent();

  @override
  List<Object> get props => [];
}

final class DataBaseSavedEvent extends DataBaseSaveEvent {
  final List<String> image;

  final String cardText;
  final String itemsText;

  final double stressValue;

  final double selfRatingValue;

  final String notes;

  const DataBaseSavedEvent({
    required this.image,
    required this.cardText,
    required this.itemsText,
    required this.stressValue,
    required this.selfRatingValue,
    required this.notes,
  });

  @override
  List<Object> get props =>
      [image, cardText, stressValue, selfRatingValue, notes];
}
