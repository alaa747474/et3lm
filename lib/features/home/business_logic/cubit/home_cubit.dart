import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:e_learning_app/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:e_learning_app/features/subjects/presentation/screens/subjects_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  String ?initialRoute;
  userstateChnages(){
    FirebaseAuth.instance.authStateChanges().listen((User?user) {
      if (user!=null) {
        
      }
     });
  }
  int selectedIndex = 0;
  List screens = [
    const SubjectsScreen(),
    const QuizScreen(),
    const ProfileScreen(),
  ];
  changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavIndex(selectedIndex));
  }
}
