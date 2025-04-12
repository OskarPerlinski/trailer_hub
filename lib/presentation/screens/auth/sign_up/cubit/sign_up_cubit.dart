import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trailer_hub/domain/auth/error/auth_exception.dart';
import 'package:trailer_hub/domain/auth/repository/auth_repository.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_up/cubit/sign_up_action.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_up/cubit/sign_up_state.dart';

@injectable
class SignUpCubit extends ActionCubit<SignUpState, SignUpAction> {
  SignUpCubit(this.authRepository) : super(const SignUpState.initial());

  final AuthRepository authRepository;

  Future<void> signUpWithEmail(
    String email,
    String password,
    String confirmPassword,
  ) async {
    if (password != confirmPassword) {
      emit(SignUpInitial(errorMessage: 'Passwords do not match'));
      return;
    }

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      emit(SignUpInitial(errorMessage: 'Please fill in all fields.'));
      return;
    }

    dispatch(const SignUpAction.showLoading());
    try {
      await authRepository.signUpWithEmail(email, password);
      dispatch(const SignUpAction.success());
    } on AuthException catch (e) {
      emit(SignUpInitial(errorMessage: e.message));
    } catch (e) {
      dispatch(
        SignUpAction.showErrorMessage(
          'An error occurred while trying to register.',
        ),
      );
    } finally {
      dispatch(SignUpAction.hideLoading());
    }
  }
}
