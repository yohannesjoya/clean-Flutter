part of 'on_boarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();
  @override
  List<Object?> get props =>[];
}

class OnBoardingPageChangeEvent extends OnBoardingEvent{

  final double pageIndex;

  const OnBoardingPageChangeEvent({this.pageIndex=0});
  @override
  List<Object?> get props =>[pageIndex];
}