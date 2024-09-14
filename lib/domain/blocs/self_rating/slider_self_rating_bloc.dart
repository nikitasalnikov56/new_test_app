import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'slider_self_rating_event.dart';
part 'slider_self_rating_state.dart';

class SliderSelfRatingBloc
    extends Bloc<SliderSelfRatingEvent, SliderSelfRatingState> {
  SliderSelfRatingBloc() : super(SliderSelfRatingInitial()) {
    on<SliderSelfRatingLoadEvent>((event, emit) {
  
      emit(SliderSelfRaitingLoadState(value: event.value));
    });
  }
}
