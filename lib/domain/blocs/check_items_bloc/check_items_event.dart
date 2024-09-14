part of 'check_items_bloc.dart';

sealed class CheckItemsEvent extends Equatable {
  const CheckItemsEvent();

  @override
  List<Object> get props => [];
}

final class CheckItemsLoadedEvent extends CheckItemsEvent {
  final int selectedIndex;
  const CheckItemsLoadedEvent({required this.selectedIndex});
  @override
  List<Object> get props => [selectedIndex];
}