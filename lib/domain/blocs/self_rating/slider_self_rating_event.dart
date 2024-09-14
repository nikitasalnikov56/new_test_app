part of 'slider_self_rating_bloc.dart';

sealed class SliderSelfRatingEvent extends Equatable {
  const SliderSelfRatingEvent();

  @override
  List<Object> get props => [];
}

class SliderSelfRatingLoadEvent extends SliderSelfRatingEvent {
  final double value;

  const SliderSelfRatingLoadEvent({required this.value});

  @override
  List<Object> get props => [value];
}
