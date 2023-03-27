part of 'lectures_cubit.dart';

@immutable
abstract class LecturesState {}

class LecturesInitial extends LecturesState {}
class LecturesLoading extends LecturesState {}
class LecturesLoaded extends LecturesState {
  final List<Lecture>lectures;

  LecturesLoaded(this.lectures);
}
