part of 'ui_interaction_bloc.dart';

sealed class UiInteractionState extends Equatable {
  const UiInteractionState();

  @override
  List<Object> get props => [];
}

final class UiInteractionInitial extends UiInteractionState {}

final class UiInteractionChangeState extends UiInteractionState {
  final bool isEnabled;
final List<int> selectedIndexes;
  const UiInteractionChangeState({required this.isEnabled,  required this.selectedIndexes});

  @override
  List<Object> get props => [isEnabled , selectedIndexes ];
}
