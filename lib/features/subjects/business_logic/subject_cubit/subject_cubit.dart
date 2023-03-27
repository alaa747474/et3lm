import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:e_learning_app/features/subjects/data/model/subject.dart';
import 'package:e_learning_app/features/subjects/data/repository/subject_repository.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit(this._subjectRepository) : super(SubjectInitial());
  final SubjectRepository _subjectRepository;
  getAllSubjects(){
    _subjectRepository.getAllSubjects().then((value) {
      emit(SubjectsLoaded(value));
    });
  }
}
