import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<OnBoardingPageChangeEvent>(_pageChangeEventHandler);
  }

  Future<void> _pageChangeEventHandler(OnBoardingPageChangeEvent event, Emitter<OnBoardingState> emit ) async {
    emit(OnBoardingPageState(pageIndex: event.pageIndex));
  }
}
