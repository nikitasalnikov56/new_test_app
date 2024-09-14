part of 'start_app_bloc.dart';

@immutable
sealed class StartAppState {}

final class StartAppInitial extends StartAppState {}

final class StartAppLoaded extends StartAppState {
  final String? time;
  StartAppLoaded({this.time});
}
