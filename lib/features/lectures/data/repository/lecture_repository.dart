import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/features/lectures/data/repository/base_lecture_repository.dart';

import '../model/lecture.dart';

class LectureRepository extends BaseLectureRepository {
  final FirebaseFirestore _firestore;

  LectureRepository(this._firestore);
  @override
  Future<List<Lecture>> getAllLectures({required String subjectName}) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection(ConstantStrings.subjectsCollection)
        .doc(subjectName)
        .collection(ConstantStrings.lecturesCollection).orderBy('video',descending: false)
        .get();
    return querySnapshot.docs
        .map((lecture) => Lecture.fromJson(lecture.data()))
        .toList();
  }
}
