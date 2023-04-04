import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/profile/data/repository/base_profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../quiz/data/model/quiz_score.dart';

class ProfileRepository extends BaseProfileRepository {
  final FirebaseFirestore _firestore;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  ProfileRepository(this._firestore);
  @override
  Future<UserModel> getStudentData() async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _firestore
            .collection(ConstantStrings.usersCollection)
            .doc(currentUser?.uid)
            .get();
    return UserModel.fromJosn(documentSnapshot.data()!);
  }
    @override
  Future<List<QuizScore>> getAllQuizzesResults() async {
    QuerySnapshot<Map<String, dynamic>> collection = await _firestore
        .collection(ConstantStrings.usersCollection)
        .doc(currentUser!.uid)
        .collection(ConstantStrings.resultsCollection)
        .get();
    return collection.docs
        .map((e) => QuizScore.fromMap(e.data()))
        .toList();
  }
}
