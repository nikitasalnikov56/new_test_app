part of 'data_base_save_bloc.dart';

sealed class DataBaseSaveState extends Equatable {
  const DataBaseSaveState();

  @override
  List<Object> get props => [];
}

final class DataBaseSaveInitial extends DataBaseSaveState {}

final class DataBaseSavedState extends DataBaseSaveState {
  const DataBaseSavedState();
  @override
  List<Object> get props => [];
}
