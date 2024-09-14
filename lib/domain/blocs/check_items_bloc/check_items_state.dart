part of 'check_items_bloc.dart';

sealed class CheckItemsState extends Equatable {
  const CheckItemsState();

  @override
  List<Object> get props => [];
}

final class CheckItemsInitial extends CheckItemsState {}

final class CheckItemsLoadedState extends CheckItemsState {
  final int selectedIndex;
  const CheckItemsLoadedState({required this.selectedIndex});
  @override
  List<Object> get props => [selectedIndex];
}
