import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'start_app_event.dart';
part 'start_app_state.dart';

class StartAppBloc extends Bloc<StartAppEvent, StartAppState> {
  StartAppBloc() : super(StartAppInitial()) {
    on<StartAppLoadingEvent>(_onLoading);
    on<StartAppLoadedEvent>(_onLoaded);
  }

  Future<void> _onLoading(event, emit) async {
    await Future.delayed(const Duration(seconds: 10));
    emit(StartAppInitial());
  }

  Future<void> _onLoaded(event, emit) async {
    final date = DateTime.now();
    final currentDate = DateFormat('d MMMM hh:mm', 'ru').format(date);
    emit(StartAppLoaded(time: currentDate));
  }
}
