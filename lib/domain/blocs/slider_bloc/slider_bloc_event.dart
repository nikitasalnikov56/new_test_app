part of 'slider_bloc_bloc.dart';

@immutable
sealed class SliderBlocEvent extends Equatable {
  const SliderBlocEvent();
  @override
  List<Object> get props => [];
}

class SliderStressEvent extends SliderBlocEvent {
  final double value;

  const SliderStressEvent({required this.value});

  @override
  List<Object> get props => [value];
}

