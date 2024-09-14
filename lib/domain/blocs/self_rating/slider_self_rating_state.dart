part of 'slider_self_rating_bloc.dart';

sealed class SliderSelfRatingState extends Equatable {
  const SliderSelfRatingState();
  
  @override
  List<Object> get props => [];
}

final class SliderSelfRatingInitial extends SliderSelfRatingState {}

//rating
final class SliderSelfRaitingLoadState extends SliderSelfRatingState {
  final double value;

  const SliderSelfRaitingLoadState({required this.value});
  @override
  List<Object> get props => [value];
}