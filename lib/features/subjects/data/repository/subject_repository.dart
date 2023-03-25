import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/features/subjects/data/model/subject.dart';
import 'package:e_learning_app/features/subjects/data/repository/base_subject_repository.dart';

class SubjectRepository extends BaseSubjectRepository {
  final FirebaseFirestore _firestore;

  SubjectRepository(this._firestore);
  @override
  Future<List<Subject>> getAllSubjects() async {
    QuerySnapshot<Map<String, dynamic>> collection =
        await _firestore.collection(ConstantStrings.subjectsCollection).get();
    return collection.docs
        .map((subject) => Subject.fromJson(subject.data()))
        .toList();
  }
}
