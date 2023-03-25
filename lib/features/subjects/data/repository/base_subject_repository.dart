import 'package:e_learning_app/features/subjects/data/model/subject.dart';

abstract class BaseSubjectRepository {
  Future<List<Subject>>getAllSubjects();
}