import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trailer_hub/domain/auth/error/auth_exception.dart';
import 'package:trailer_hub/domain/auth/repository/auth_repository.dart';
import 'package:trailer_hub/presentation/screens/auth/reset_password/cubit/reset_password_action.dart';
import 'package:trailer_hub/presentation/screens/auth/reset_password/cubit/reset_password_state.dart';

@injectable
class ResetPasswordCubit
    extends ActionCubit<ResetPasswordState, ResetPasswordAction> {
  ResetPasswordCubit(this.authRepository) : super(ResetPasswordState.initial());

  final AuthRepository authRepository;

  Future<void> resetPassword(String email) async {

    if (email.isEmpty) {
      emit(ResetPasswordInitial(errorMessage: 'Please enter email.'));
      return;
    }


    dispatch(ResetPasswordAction.showLoading());
    try {
      await authRepository.resetPassword(email);
      dispatch(ResetPasswordAction.success());
    } on AuthException catch (e) {
      emit(ResetPasswordState.initial(errorMessage: e.message));
    } catch (e) {
      dispatch(
        ResetPasswordAction.showErrorMessage(
          'An error occurred while trying to send email.',
        ),
      );
    } finally {
      dispatch(ResetPasswordAction.hideLoading());
    }
  }
}
