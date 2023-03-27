import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/features/lectures/data/repository/lecture_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt=GetIt.instance;
setUpServiceLocator(){
getIt.registerSingleton<LectureRepository>(LectureRepository(FirebaseFirestore.instance));
}