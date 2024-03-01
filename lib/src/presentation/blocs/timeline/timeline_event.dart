part of 'timeline_bloc.dart';

@immutable
abstract class TimelineEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class TimelineBackEvent extends TimelineEvent {}

class GetTimelineEvent extends TimelineEvent {
  final Timeline timeline;

  GetTimelineEvent({
    required this.timeline,
  });
}
