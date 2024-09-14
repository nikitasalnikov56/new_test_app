import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'slider_bloc_event.dart';
part 'slider_bloc_state.dart';

class SliderStressBloc extends Bloc<SliderBlocEvent, SliderBlocState> {
  SliderStressBloc() : super(SliderBlocInitial()) {
    on<SliderStressEvent>((event, emit) {
      emit(SliderBlocStressState(value: event.value));
    });
  
  }
}
