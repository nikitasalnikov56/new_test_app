part of 'start_app_bloc.dart';

@immutable
sealed class StartAppEvent {}

class StartAppLoadingEvent extends StartAppEvent{}
class StartAppLoadedEvent extends StartAppEvent{}