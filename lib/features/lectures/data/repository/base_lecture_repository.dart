
import '../model/lecture.dart';

abstract class BaseLectureRepository {
 Future<List<Lecture>> getAllLectures({ required String subjectName});
}