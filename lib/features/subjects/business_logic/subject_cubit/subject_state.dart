part of 'subject_cubit.dart';

@immutable
abstract class SubjectState {}

class SubjectInitial extends SubjectState {}
class SubjectsLoaded extends SubjectState {
  final List<Subject>subjects;

  SubjectsLoaded(this.subjects);
}
