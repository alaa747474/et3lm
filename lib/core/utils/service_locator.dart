import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:e_learning_app/features/lectures/data/repository/lecture_repository.dart';
import 'package:e_learning_app/features/profile/data/repository/profile_repository.dart';
import 'package:e_learning_app/features/quiz/data/repository/quiz_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt getIt=GetIt.instance;
setUpServiceLocator(){
getIt.registerSingleton<LectureRepository>(LectureRepository(FirebaseFirestore.instance));
getIt.registerSingleton<ProfileRepository>(ProfileRepository(FirebaseFirestore.instance));
getIt.registerSingleton<AuthRepository>(AuthRepository(FirebaseAuth.instance,));
getIt.registerSingleton<QuizRepository>(QuizRepository(FirebaseFirestore.instance));
}