part of 'ui_interaction_bloc.dart';

sealed class UiInteractionEvent extends Equatable {
  const UiInteractionEvent();

  @override
  List<Object> get props => [];
}

final class UiInteractionChangeEvent extends UiInteractionEvent {
  final bool isEnabled;
  final List<int> selectedIndexes;
  const UiInteractionChangeEvent({required this.isEnabled,required  this.selectedIndexes});

  @override
  List<Object> get props => [isEnabled , selectedIndexes ];
}