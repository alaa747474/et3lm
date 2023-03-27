import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/lectures/data/model/lecture.dart';
import 'package:e_learning_app/features/lectures/data/repository/lecture_repository.dart';
import 'package:meta/meta.dart';

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit(this._lectureRepository) : super(LecturesInitial());
  final LectureRepository _lectureRepository;
  getAllLectures({required String subjectName}){
    emit(LecturesLoading());
    _lectureRepository.getAllLectures(subjectName: subjectName).then((lectures){
      emit(LecturesLoaded(lectures));
    });
  }
}
