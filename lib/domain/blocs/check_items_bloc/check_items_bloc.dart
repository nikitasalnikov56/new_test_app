import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_items_event.dart';
part 'check_items_state.dart';

class CheckItemsBloc extends Bloc<CheckItemsEvent, CheckItemsState> {
  CheckItemsBloc() : super(CheckItemsInitial()) {
    on<CheckItemsLoadedEvent>((event, emit) {
      emit(CheckItemsLoadedState(selectedIndex: event.selectedIndex));
    });
  }
}
