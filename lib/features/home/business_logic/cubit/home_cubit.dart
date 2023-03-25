import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:e_learning_app/features/subjects/presentation/screens/subjects_screen.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int selectedIndex = 0;
  
  List screens = [
    const SubjectsScreen(),
    const ProfileScreen(),

  ];
  changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavIndex(selectedIndex));
  }
}
