import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trailer_hub/domain/auth/error/auth_exception.dart';
import 'package:trailer_hub/domain/auth/repository/auth_repository.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_in/cubit/sign_in_action.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_in/cubit/sign_in_state.dart';

@injectable
class SignInCubit extends ActionCubit<SignInState, SignInAction> {
  SignInCubit(this.authRepository) : super(SignInState.initial());

  final AuthRepository authRepository;

  Future<void> signInWithEmail(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(SignInInitial(errorMessage: 'Please fill in all fields.'));
      return;
    }

    dispatch(const SignInAction.showLoading());
    try {
      await authRepository.signInWithEmail(email, password);
      dispatch(SignInAction.success());
    } on AuthException catch (e) {
      emit(SignInInitial(errorMessage: e.message));
    } catch (e) {
      dispatch(
        SignInAction.showErrorMessage(
          'An error occurred while trying to login.',
        ),
      );
    } finally {
      dispatch(SignInAction.hideLoading());
    }
  }

  Future<void> loginWithGoogle() async {
    dispatch(const SignInAction.showLoading());

    try {
      await authRepository.signInWithGoogle();
      dispatch(const SignInAction.success());
    } on AuthException catch (e) {
      dispatch(SignInAction.showErrorMessage(e.message));
    } catch (e) {
      dispatch(
        SignInAction.showErrorMessage("An error occurred during login."),
      );
    } finally {
      dispatch(const SignInAction.hideLoading());
    }
  }
}
