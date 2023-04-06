import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'animation_state.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit() : super(AnimationInitial());
  int height = 100;
  int width = 100;
  int radius = 150;
  void changeProfilePicSize() {
    height = height == 300 ? 100 : 300;
    width = width == 400 ? 100 : 400;
    radius = radius == 150 ? 15 : 150;
    emit(ProfileAnimation());
  }
}
