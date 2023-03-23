import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepository _authRepo;
  void createAccount(
      {required String name,
      required String email,
      required String password,
      required String universityId,
      required String phoneNumber,
      required String profilePic}) async {
    emit(AuthLoading());
    UserModel user =
        UserModel(name, email, password, universityId, phoneNumber, profilePic);
   _authRepo.createAccount(userModel: user).then((value) {
      emit(CreateAccountDone());
    });
  }

  void signIn({
    required String email,
    required String password,
  }) {
    emit(AuthLoading());
    _authRepo.signIn(email: email, password: password).then((value) {
      emit(SingInDone());
    });
  }

  void signOut(){
    emit(AuthLoading());
    _authRepo.signOut().then((value) {
      emit(SingOutDone());
    });
  }
}
