import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ui_interaction_event.dart';
part 'ui_interaction_state.dart';

class UiInteractionBloc extends Bloc<UiInteractionEvent, UiInteractionState> {
  UiInteractionBloc() : super(UiInteractionInitial()) {
    on<UiInteractionChangeEvent>((event, emit) {
      emit(UiInteractionChangeState(isEnabled: event.isEnabled, selectedIndexes: event.selectedIndexes,));
    });
  }
}
