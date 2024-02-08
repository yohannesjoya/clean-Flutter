part of 'on_boarding_bloc.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();
  @override
  List<Object> get props => [];
}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingPageState extends OnBoardingState{
  final double pageIndex;
  const OnBoardingPageState({this.pageIndex = 0});
  @override
  List<Object> get props => [pageIndex];
}
