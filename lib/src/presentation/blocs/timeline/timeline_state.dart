part of 'timeline_bloc.dart';

@immutable
abstract class TimelineState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class TimelineInitialState extends TimelineState {}

class TimelineBackState extends TimelineState {}

class GetTimeLineSkeletonState extends TimelineState {}

class GetTimeLineSuccessState extends TimelineState {
  final List<GetTimeLine> timelines;

  GetTimeLineSuccessState({
    required this.timelines,
  });
}

class GetTimeLineErrorState extends TimelineState {
  final String errorMessage;

  GetTimeLineErrorState({
    required this.errorMessage,
  });
}
