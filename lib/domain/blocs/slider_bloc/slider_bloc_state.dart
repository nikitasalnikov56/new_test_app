part of 'slider_bloc_bloc.dart';

@immutable
sealed class SliderBlocState extends Equatable {
  const SliderBlocState();
  @override
  List<Object> get props => [];
}

final class SliderBlocInitial extends SliderBlocState {}

//stress
final class SliderBlocStressState extends SliderBlocState {
  final double value;

  const SliderBlocStressState({required this.value});
  @override
  List<Object> get props => [value];
}

